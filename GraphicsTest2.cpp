
#include <GL/glut.h>
#include <iostream>
#include <cmath>
using namespace std;

float x1, y11, x2, y2, x3, y3, x4, y4;

void Rectangle()
{
    glColor3f(1, 1, 1);
    glBegin(GL_QUADS);
        glVertex2f(x1, y11);
        glVertex2f(x2, y2);
        glVertex2f(x3, y3);
        glVertex2f(x4, y4);
    glEnd();
}

void XShear()
{
    float shx = 0.5;
    float sx1 = x1 + shx * y11;
    float sx2 = x2 + shx * y2;
    float sx3 = x3 + shx * y3;
    float sx4 = x4 + shx * y4;

    glColor3f(1, 0, 0);
    glBegin(GL_QUADS);
        glVertex2f(sx1, y11);
        glVertex2f(sx2, y2);
        glVertex2f(sx3, y3);
        glVertex2f(sx4, y4);
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


    x1 = -120;
    y11 = -80;
    x2 =  120;
    y2 = -80;
    x3 =  120;
    y3 =  80;
    x4 = -120;
    y4 =  80;

    Rectangle();

    XShear();

    glFlush();
}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowSize(640, 480);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("Traffic");

    glClearColor(0, 0, 0, 1);
    glutDisplayFunc(display);
    glutMainLoop();

    return 0;
}
