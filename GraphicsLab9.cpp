
#include <GL/glut.h>
#include <cstdlib>

float x = -1.0f;
float y = 0.0f;

float moveStep = 0.02f;

bool moving = true;

float directionX = 1.0f;
float directionY = 0.0f;

void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glLoadIdentity();

    glTranslatef(x, y, 0.0f);

    glColor3f(0.0f, 1.0f, 0.0f);

    glBegin(GL_QUADS);
        glVertex2f(-0.1f, -0.1f);
        glVertex2f( 0.1f, -0.1f);
        glVertex2f( 0.1f,  0.1f);
        glVertex2f(-0.1f,  0.1f);
    glEnd();

    glFlush();
}

void update(int value)
{
    if (moving)
    {
        x += directionX * moveStep;
        y += directionY * moveStep;

        if (x > 1.1f)
            x = -1.1f;

        if (x < -1.1f)
            x = 1.1f;

        if (y > 1.1f)
            y = -1.1f;

        if (y < -1.1f)
            y = 1.1f;
    }

    glutPostRedisplay();

    glutTimerFunc(16, update, 0);
}

void keyboard(unsigned char key, int a, int b)
{
    switch (key)
    {
        case 'a':
        case 'A':
            directionX = -1.0f;
            directionY = 0.0f;
            moving = true;
            break;

        case 'w':
        case 'W':
            directionX = 0.0f;
            directionY = 1.0f;
            moving = true;
            break;

        case 's':
        case 'S':
            directionX = 0.0f;
            directionY = -1.0f;
            moving = true;
            break;

        case 'd':
        case 'D':
            directionX = 1.0f;
            directionY = 0.0f;
            moving = true;
            break;

        case 'p':
        case 'P':
            moving = false;
            break;

        case 'r':
        case 'R':
            x = -1.0f;
            y = 0.0f;

            directionX = 1.0f;
            directionY = 0.0f;

            moving = true;
            break;

        case 27:
            exit(0);
            break;
    }

    glutPostRedisplay();
}

void init()
{
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    gluOrtho2D(-1, 1, -1, 1);

    glMatrixMode(GL_MODELVIEW);
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);

    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(600, 600);

    glutCreateWindow("Rectangle Movement Control");

    init();

    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);

    glutTimerFunc(16, update, 0);

    glutMainLoop();

    return 0;
}
