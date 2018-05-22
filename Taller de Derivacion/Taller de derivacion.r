
rm(list=ls())

interNewton<-function(M){
  res<-0
  k<-1
  res<-M
  tam<-NROW(res)
  temp<-0
  temp[c(1)]<-res[1,2]
  while(k<tam)
  {
    k<-k+1
    j<-k
    i<-1
    while((j-1)<=(tam-1))
    {
      #up<-(res[j,2]-res[j-1,2])
      #down<-(res[j,1]-res[i,1])
      temp[c(j)]<-(res[j,2]-res[j-1,2])/(res[j,1]-res[i,1])
      #temp[c(j)]<-up/down
      i<-i+1
      j<-j+1
      
    }
    #cat("" solución: ",temp,"\n")
    res[,2]<-temp
  }
  return(res)
}

solucionadorN=function(p,x,n){
  i=2;
  j=1;
  if((0<=n)&&(n<=(NROW(p))))
  {
    acum=p[1,2]
    while(i<=n+1){
      multi=1
      while(j<i){
        multi=multi*(x-p[j,1])
        j=j+1;
      }
      multi=multi*p[i,2]
      i=i+1;
      j=1
      acum=acum+multi
    }
    return(acum)
  }
  else cat("Grado no posible","\n")
}

M =matrix(c(50,80,110,140,170,3.5,4.2,5.7,3.8,1.2),ncol=2,nrow=5)
p<-interNewton(M)
cat("polinomio de interpolación","\n",p,"\n")
## polinomio de interpolación 
##  50 80 110 140 170 3.5 0.02333333 0.0004444444 -2.592593e-05 3.549383e-07
x<-seq(50,180,0.1)
plot(x,solucionadorN(p,x,4),type="l",col="blue")
abline(h=0,col="blue")
points(rbind(M),pch=19,cex=0.7,col="red")
#Se procede a derivar por formula tres puntos valor medio. 

trespuntosMedio=function(p,x,h)
{
  
  res=(solucionadorN(p,(x+h),4) -(solucionadorN(p,(x-h),4)))/2*h
  #cat("resultado ",res, "error ",((h*h/6)*Fx(x)),"\n")
  #cat("resultado: ",res,"\n")
  return(res)
}
cat("velocidad en el centro de la trayectoria: ",trespuntosMedio(p,110,0.001),"\n")
## velocidad en el centro de la trayectoria:  -2.5e-09
#Se deriva toda la función para hallar la segunda derivada
i=1
der1=matrix(c(0),ncol=2,nrow=5)
der1[,1]=M[,1]
X=50
while(i<=5)
{
  der1[i,2]=trespuntosMedio(p,X,0.001)
  i=i+1
  X=X+30
}
p2<-interNewton(der1)
cat("polinomio de interpolación","\n",p2,"\n")
## polinomio de interpolación 
##  50 80 110 140 170 -9.416667e-08 5.777778e-09 -1.416667e-10 1.419753e-12 -9.137155e-26
x<-seq(50,180,0.1)
par(new=TRUE)
plot(x,solucionadorN(p2,x,4),type="l",col="green")
abline(h=0,col="blue")
points(rbind(der1),pch=19,cex=0.7,col="red")

