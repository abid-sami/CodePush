#include<GL/glut.h>
#include<stdlib.h>
#include<iostream>
#include<cmath>
#define PI 3.1416
using namespace std;

float x, y, xx, xxx, yy, yyy;

void display(void)
{

    glClear(GL_COLOR_BUFFER_BIT);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    glColor3f(1,0,0);
    glBegin(GL_TRIANGLES);

    glVertex2f(x,y);
    glVertex2f(xx,yy);
    glVertex2f(xxx,yyy);

    glEnd();




    glClear(GL_COLOR_BUFFER_BIT);
    glLoadIdentity();
    gluOrtho2D(-320, 320, -240, 240);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    glColor3f(1,1,0);
    glBegin(GL_TRIANGLES);
    float cx=1.2, cy=1.2;
    float nx=x*cx, ny=y*cy;
    float nx1=xx*cx, ny1=yy*cy;
    float nx2=xxx*cx, ny2=yyy*cy;

    glVertex2f(nx,ny);
    glVertex2f(nx1,ny1);
    glVertex2f(nx2,ny2);




    glEnd();
    glFlush();


}


int main(int argc, char *argv[])
{
    cin>>x>>y>>xx>>yy>>xxx>>yyy;
    glutInit(&argc, argv);
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);

    glutCreateWindow("GLUT Shapes");
    glutDisplayFunc(display);


    glutMainLoop();

    return EXIT_SUCCESS;
}
