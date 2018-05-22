
# coding: utf-8

# In[ ]:


import numpy as np
import pylab as pl

def euler (f,x,y,h,m):
  u = np.zeros([m,2])
  for i in range(m):
    y=y+h*f(x,y)
    x=x+h
    u[i,0]=x
    u[i,1]=y
  return u


def f(x,y): return y-x**2+x+1

u=euler (f,0,1,0.1,20)
print (u)
pl.plot(u[:,0],u[:,1],'or')
def y(x): return math.exp(x)+x**2+x
x = pl.arange(0,2.1,0.1)
pl.plot(x,y(x),'ob')
pl.grid(True)
pl.show()

