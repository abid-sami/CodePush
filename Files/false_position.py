from math import fabs

def f(x):
    return x**3-2*x-5

def false_position(xl, xu, max_itr=300, eps=0.05):
    if f(xl)*f(xu)>0:
        print("Wrong guess")
        return None
    if f(xl)*f(xu)==0:
        if f(xl)==0:
            return xl
        else:
            return xu
        
    xr_old=(xl*f(xu)-xu*f(xl))/(f(xu)-f(xl))
    itr=1
    while(True):
        if f(xl)*f(xr_old)>0:
            xl=xr_old
        elif f(xl)*f(xr_old)<0:
            xu=xr_old
        else:
            return xr_old
        xr_new=(xl*f(xu)-xu*f(xl))/(f(xu)-f(xl))
        ae=fabs(xr_old-xr_new)
        xr_old=xr_new
        itr=itr+1
        if ae<=eps or itr>max_itr:
            break
    return xr_old  
    
xl=float(input("Enter Lower Limit: "))
xu=float(input("Enter Upper Limit: "))
xr=false_position(xl, xu)

if xr is not None:
    print(f"Root is at: {xr:.3f}")
    print(f"(xr) {f(xr):.3f}")