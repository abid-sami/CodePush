#pip install numpy
#pip install matplotlib numpy
import numpy as np
import matplotlib.pyplot as plt

x=np.array([1,2,3,4,5])
y=np.array([0.6, 2.4, 3.5, 4.8, 5.7])
m=len(x)

print("Total number of data: ", m)

sum_x=np.sum(x)
sum_y=np.sum(y)
sum_x2=np.sum(x*x)
sum_xy=np.sum(x*y)

x_mean=sum_x/m
y_mean=sum_y/m

a1=(m*sum_xy-(sum_x*sum_y))/((m*sum_x2)-(sum_x**2))
a0=y_mean-(a1*x_mean)

print(a1, a0)
print(f"Slope at: {a1:.3f}")
print(f"Intercept at: {a0:.3f}")

y_pred=a0+(a1*x)

plt.scatter(x,y, color="red", label="Data Point")
plt.plot(x,y_pred, color="blue", label="Best fitted line")
plt.legend()
plt.show()