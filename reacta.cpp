#include <GL/glut.h>
#include <iostream>
#include <cmath>
using namespace std;

void Recta(float x1, float y1, float x2, float y2, float x3, float y3,float x4,float y4)
{
    glColor3f(1, 1, 1);
    glBegin(GL_QUADS);
    glVertex2f(x1, y1);
    glVertex2f(x2, y2);
    glVertex2f(x3, y3);
     glVertex2f(x4, y4);

    glEnd();
}

void XShear(float x1, float y1, float x2, float y2,float x3, float y3, float x4, float y4)
{
    float shx = 0.5;

    x1 = x1 + shx * y1;
    x2 = x2 + shx * y2;
    x3 = x3 + shx * y3;
    x4 = x4 + shx * y4;

    glColor3f(1, 1, 1);
    glBegin(GL_QUADS);
        glVertex2f(x1, y1);
        glVertex2f(x2, y2);
        glVertex2f(x3, y3);
        glVertex2f(x4, y4);
    glEnd();
}

void display()
{
    glClear(GL_COLOR_BUFFER_BIT);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    Recta(-120, -80, 120, -80, 120, 80, -120, 80);
    XShear(-120, -80, 120, -80, 120, 80, -120, 80);

    glFlush();
}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowSize(640, 480);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("2D Transformations");

    glClearColor(0, 0, 0, 1);
    glutDisplayFunc(display);
    glutMainLoop();

    return 0;
}