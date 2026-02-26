# ⚡ CodeVault — Secure GitHub Uploader

A developer-focused web app to upload and manage code files directly to your GitHub repository. GitHub credentials are stored **server-side only** and never exposed to the frontend.

---

## 🚀 Quick Start

### 1. Install dependencies

```bash
npm install
```

### 2. Configure environment

```bash
cp .env.example .env
```

Edit `.env` and fill in your details:

```env
GITHUB_TOKEN=ghp_your_personal_access_token
GITHUB_OWNER=your_github_username
GITHUB_REPO=your_target_repository
GITHUB_BRANCH=main
PORT=3000
```

**Getting a GitHub Token:**
1. Go to GitHub → Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
2. Click **Generate new token**
3. Select scopes: `repo` (full control of private repositories)
4. Copy the token and paste it into `.env`

### 3. Run the server

```bash
# Production
npm start

# Development (auto-restart)
npm run dev
```

### 4. Open the app

Navigate to [http://localhost:3000](http://localhost:3000)

---

## ✨ Features

| Feature | Details |
|---|---|
| **Code Editor** | Syntax-highlighted textarea with language selection |
| **File Upload** | Drag & drop, multiple files, size/type validation |
| **Secure Backend** | GitHub token never touches the frontend |
| **Dark/Light Mode** | Toggle with one click |
| **Progress Indicators** | Animated upload progress bar |
| **Toast Notifications** | Success/error feedback with commit links |
| **File Validation** | Only allowed extensions accepted |

## 📁 Allowed File Types

Any file type is allowed, up to the 5MB per-file limit.

---

## 🔐 Security Notes

- `GITHUB_TOKEN` is stored in `.env` and **never** sent to the browser
- `.env` is in `.gitignore` — never commit it
- File paths are sanitized with `path.basename()` to prevent path traversal
- File size limit: 5MB per file

## 📡 API Endpoints

| Method | Route | Description |
|---|---|---|
| `GET` | `/api/health` | Server + GitHub config status |
| `POST` | `/api/upload/code` | Push code from editor |
| `POST` | `/api/upload/files` | Push uploaded files |

---

## 🛠 Tech Stack

- **Frontend:** HTML, CSS, Vanilla JS (no framework needed)
- **Backend:** Node.js + Express
- **GitHub Integration:** `@octokit/rest`
- **File Handling:** Multer
