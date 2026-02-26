require('dotenv').config();
const express = require('express');
const multer = require('multer');
const cors = require('cors');
const { Octokit } = require('@octokit/rest');
const path = require('path');

const app = express();
const upload = multer({ storage: multer.memoryStorage(), limits: { fileSize: 5 * 1024 * 1024 } });

// ─── GitHub config (hidden from frontend) ────────────────────────────────────
const GITHUB_TOKEN  = process.env.GITHUB_TOKEN;
const GITHUB_OWNER  = process.env.GITHUB_OWNER;
const GITHUB_REPO   = process.env.GITHUB_REPO;
const GITHUB_BRANCH = process.env.GITHUB_BRANCH || 'main';

app.use(cors());
app.use(express.json({ limit: '10mb' }));
app.use(express.static(path.join(__dirname, 'public')));

function getOctokit() {
  if (!GITHUB_TOKEN || !GITHUB_OWNER || !GITHUB_REPO) {
    throw new Error('GitHub configuration is missing. Check your .env file.');
  }
  return new Octokit({ auth: GITHUB_TOKEN });
}

async function pushToGitHub(octokit, filePath, content, commitMessage) {
  const contentBase64 = Buffer.from(content).toString('base64');
  let sha;
  try {
    const { data } = await octokit.repos.getContent({
      owner: GITHUB_OWNER,
      repo: GITHUB_REPO,
      path: filePath,
      ref: GITHUB_BRANCH,
    });
    sha = data.sha;
  } catch (e) {
    sha = undefined;
  }

  const params = {
    owner: GITHUB_OWNER,
    repo: GITHUB_REPO,
    path: filePath,
    message: commitMessage || `Upload ${filePath}`,
    content: contentBase64,
    branch: GITHUB_BRANCH,
  };
  if (sha) params.sha = sha;

  const result = await octokit.repos.createOrUpdateFileContents(params);
  return result.data.commit.html_url;
}

app.get('/api/health', (req, res) => {
  const configured = !!(GITHUB_TOKEN && GITHUB_OWNER && GITHUB_REPO);
  res.json({ status: 'ok', configured });
});

app.post('/api/upload/code', async (req, res) => {
  try {
    const { filename, content, commitMessage } = req.body;

    if (!filename || !content) {
      return res.status(400).json({ error: 'filename and content are required.' });
    }

    const safeFilename = path.basename(filename);

    const octokit = getOctokit();
    const commitUrl = await pushToGitHub(
      octokit, `Files/${safeFilename}`, content,
      commitMessage || `Add ${safeFilename} via CodeVault`
    );

    res.json({ success: true, message: `${safeFilename} pushed successfully.`, commitUrl });
  } catch (err) {
    console.error('Code upload error:', err.message);
    res.status(500).json({ error: err.message || 'Upload failed.' });
  }
});

app.post('/api/upload/files', upload.array('files', 20), async (req, res) => {
  try {
    const { commitMessage } = req.body;
    const files = req.files;

    if (!files || files.length === 0) {
      return res.status(400).json({ error: 'No files provided.' });
    }

    const octokit = getOctokit();
    const results = [];

    for (const file of files) {
      const safeFilename = path.basename(file.originalname);
      const content = file.buffer.toString('utf-8');
      const commitUrl = await pushToGitHub(
        octokit, `Files/${safeFilename}`, content,
        commitMessage || `Upload ${safeFilename} via CodeVault`
      );
      results.push({ filename: safeFilename, commitUrl, size: file.size });
    }

    res.json({ success: true, message: `${results.length} file(s) pushed successfully.`, results });
  } catch (err) {
    console.error('File upload error:', err.message);
    res.status(500).json({ error: err.message || 'Upload failed.' });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`CodeVault running on http://localhost:${PORT}`));
