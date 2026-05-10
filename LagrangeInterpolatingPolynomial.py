import numpy as np
import matplotlib.pyplot as plt

x_values=np.array([1,3,5], dtype=float)
y_values=np.array([2, 10, 26], dtype=float)

def LagrangeInterpolation(x_values, y_values, x):
    n=len(x_values)
    result=0
    for i in range(n):
        term=y_values[i]
        for j in range(n):
            if j!=i:
                term=term*(x-x_values[j])/(x_values[i]-x_values[j])
        result+=term
    return result

# y=LagrangeInterpolation(x_values, y_values, x)
# print(f"Interpolated value at x= ",x, "is: ",y)    

x_points=np.linspace(1,5,200)
print(x_points[1])

y_points=[]
for x in x_points:
    y=LagrangeInterpolation(x_values, y_values, x)
    y_points.append(y)

plt.plot(x_points, y_points, color="blue", label="Lagrange Polynomial")   
plt.scatter(x_values, y_values, color="red", label="Data Point")
plt.xlabel('x')
plt.ylabel('y') 
plt.legend()
plt.grid(True)
plt.show()