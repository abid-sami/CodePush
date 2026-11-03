#include <GL/glut.h>
#include <iostream>
#include <cstdlib>
using namespace std;

float posX = 0.0f, posY = 0.0f;
float colorR = 1.0f, colorG = 0.0f, colorB = 0.0f;

float moveStep = 0.1f;
float rectWidth = 0.3f;
float rectHeight = 0.2f;

void drawRectangle()
{
    glColor3f(colorR, colorG, colorB);

    glBegin(GL_QUADS);
        glVertex2f(posX - rectWidth, posY - rectHeight);
        glVertex2f(posX + rectWidth, posY - rectHeight);
        glVertex2f(posX + rectWidth, posY + rectHeight);
        glVertex2f(posX - rectWidth, posY + rectHeight);
    glEnd();
}

void display()
{
    glClear(GL_COLOR_BUFFER_BIT);

    glLoadIdentity();

    drawRectangle();

    glFlush();
}

void keyboard(unsigned char key, int x, int y)
{
    switch (key)
    {
        case 'w':
        case 'W':
            if (posY + rectHeight + moveStep <= 1.0f)
                posY += moveStep;
            break;

        case 's':
        case 'S':
            if (posY - rectHeight - moveStep >= -1.0f)
                posY -= moveStep;
            break;

        case 'a':
        case 'A':
            if (posX - rectWidth - moveStep >= -1.0f)
                posX -= moveStep;
            break;

        case 'd':
        case 'D':
            if (posX + rectWidth + moveStep <= 1.0f)
                posX += moveStep;
            break;

        case 'r':
        case 'R':
            colorR = (float)rand() / RAND_MAX;
            colorG = (float)rand() / RAND_MAX;
            colorB = (float)rand() / RAND_MAX;
            break;

        case 27:
            exit(0);
    }

    glutPostRedisplay();
}

void init()
{
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-1.0, 1.0, -1.0, 1.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(800, 600);

    glutCreateWindow("Rectangle Movement Using Keyboard");

    init();

    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);

    cout << "\nKeyboard Controls:\n";
    cout << "W : Move Up\n";
    cout << "S : Move Down\n";
    cout << "A : Move Left\n";
    cout << "D : Move Right\n";
    cout << "R : Change Rectangle Color\n";
    cout << "ESC : Exit Program\n";

    glutMainLoop();
}