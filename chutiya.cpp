#include<GL/glut.h>
#include<stdlib.h>
#include<iostream>
#include<cmath>
#define PI 3.1416
using namespace std;

void display(void)
{

    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);


    glBegin(GL_TRIANGLES);
    glColor3f(1,0,0);

    glVertex2i(10, 10);
    glVertex2i(100, 10);
    glVertex2i(50, 50);
    glEnd();
    glFlush();


}


int main(int argc, char *argv[])
{
    //cin>>x>>y>>xx>>yy>>xxx>>yyy;
    glutInit(&argc, argv);
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE | GLUT_DEPTH);

    glutCreateWindow("GLUT Shapes");
    glutDisplayFunc(display);


    glutMainLoop();

    return EXIT_SUCCESS;
}
