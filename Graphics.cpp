
#include <GL/glut.h>
#include <stdlib.h>
#include <iostream>
using namespace std;

 float tx, ty, x1, y1, x2, y2;

//Translate
/* void display()
{
    glColor3f(0,1,0);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);
    glVertex2f(x2, y2);
    glBegin(GL_LINES);

    glVertex2f(x1, y1);
    glVertex2f(x2, y2);

    x1=x1+tx;
    y1=y1+ty;

    x2=x2+tx;
    y2=y2+ty;

    glVertex2f(x1, y1);
    glVertex2f(x2, y2);

    glEnd();
    glFlush();
}
*/

//Scaling
void display()
{
    glColor3f(0,1,0);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);
    glVertex2f(x2, y2);
    glBegin(GL_LINES);

    glVertex2f(x1, y1);
    glVertex2f(x2, y2);

    x1=x1*tx;
    y1=y1*ty;

    x2=x2*tx;
    y2=y2*ty;

    glVertex2f(x1, y1);
    glVertex2f(x2, y2);

    glEnd();
    glFlush();
}




int main(int argc, char *argv[])
{
    cin>>tx>>ty>>x1>>y1>>x2>>y2;
    glutInit(&argc, argv);
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE | GLUT_DEPTH);

    glutCreateWindow("GLUT Shapes");

    glutDisplayFunc(display);



    glutMainLoop();

    return EXIT_SUCCESS;
}
