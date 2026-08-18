#include <GL/glut.h>
#include <math.h>
#include <bits/stdc++.h>
using namespace std;

void display()
{
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    float ys = 0.1;
    float ye = 0.4;
    float xs = 0.2;
    float xe = 0.6;

    float m = (ye - ys) / (xe - xs);

    if (m < 1)
    {
        if (xs > xe)
        {
            swap(xs, xe);
            swap(ys, ye);
        }

        float x = xs;
        float y = ys;

        glBegin(GL_POINTS);

        while (x <= xe)
        {
            glColor3f(1, 0, 1);
            glVertex2f(x, y);

            x += 0.001;
            y = y + m * 0.001;
        }

        glEnd();
    }

    else if (m > 1)
    {
        if (ys > ye)
        {
            swap(xs, xe);
            swap(ys, ye);
        }

        float x = xs;
        float y = ys;

        glBegin(GL_POINTS);

        while (y <= ye)
        {
            glColor3f(1, 0, 1);
            glVertex2f(x, y);

            y += 0.001;
            x = x + (1 / m) * 0.001;
        }

        glEnd();
    }

    float c = ys - m * xs;

    cout << m << endl;

    glFlush();
}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);

    glutInitWindowSize(640, 480);
    glutInitWindowPosition(10, 10);

    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE | GLUT_DEPTH);

    glutCreateWindow("GLUT Shapes");

    glutDisplayFunc(display);

    glutMainLoop();

    return EXIT_SUCCESS;
}
