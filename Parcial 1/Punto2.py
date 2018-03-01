
# coding: utf-8

# In[35]:



import math
import sympy as sy


x = sy.Symbol('x')
f = sy.exp(x)

# Uso de la funcion de taylor :
def taylor(funcionTaylor,x0,n):
    i = 0
    p = 0
    while i <= n:
        p = p + (funcionTaylor.diff(x,i).subs(x,x0))/(math.factorial(i))*(x-x0)**i
        i +=1
    return p


def evaluarTaylor(n,resultEva): 
    funcionTaylor = str(taylor(f,0,n))
    x = resultEva
    return eval(funcionTaylor)

def aitken(x0,x1,x2,resultEva,Iteraciones):        
    error = 1
    j = 3
    i = 1
#Formula de aitoken
    a0 = x2-((x2-x1)**2)/(x2-2*x1+x0)
    while(error >= Iteraciones):
        a1 = a0        
        x0 = evaluarTaylor(j-2,resultEva)
        x1 = evaluarTaylor(j-1,resultEva)
        x2 = evaluarTaylor(j,resultEva)        
        a0 = x2-((x2-x1)**2)/(x2-2*x1+x0) 
        error = (abs(a0-a1)/abs(a0))
        j += 1
        i += 1
        print("\t R: ",a0,"   \t E:",error)

resultEva = 1


aitken(x0, x1, x2, resultEva,E)

