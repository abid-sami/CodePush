#include <GL/glut.h>
#include <math.h>
#include <iostream>
using namespace std;

void DCirkel()
{

    glBegin(GL_POINTS);

    float r=0.8;
    float x=0, y=r;

    while (x <= r)
    {
        glColor3f(0, 1, 1);
        glVertex2f(x, y);
        glVertex2f(x, -y);
        glVertex2f(-x, -y);
        glVertex2f(-x, y);

        x += 0.001;
        y = sqrt(r*r-x*x);

    }

    glEnd();

}

void MidCirkel()
{

    glBegin(GL_POINTS);

    float r=100;
    float x=0, y=r;
    float p0=1-r;

    while (x <= y)
    {
        glColor3f(0, 1, 1);
        glVertex2f(x, y);
        glVertex2f(y, x);
        glVertex2f(y, -x);
        glVertex2f(x, -y);
        glVertex2f(-x, -y);
        glVertex2f(-y, -x);
        glVertex2f(-y, x);
        glVertex2f(-x, y);

        if(p0<0)
        {

            x += 1;
            p0=p0+2*x+3;
        }
        else if(p0>=0)
        {
            x+=1;
            y-=1;
            p0=p0+2*x-2*y+5;
        }

    }

    glEnd();

}

void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(320,-320,240,-240);

    // Call the functions here


    //DCirkel();

    MidCirkel();


    glFlush();


}


int main(int argc, char *argv[])
{
    glutInit(&argc, argv);

    glutInitWindowSize(1280, 1280);
    glutInitWindowPosition(100, 100);

    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);

    glutCreateWindow("Circle Drawing Algorithms");

    glutDisplayFunc(display);

    glutMainLoop();

    return 0;
}
