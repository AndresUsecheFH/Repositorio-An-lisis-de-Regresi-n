attach(examenes)
r=lm(F~.,data=examenes)
library(car)
res=rstudent(r)
Fest=fitted(r)

#grafico residuos. Hipótesis

plot(Fest,res,main="residuo estandarizado",ylim=c(-3,3)
     ,pch=16,cex=1.5,cex.lab=1.5,cex.axis=1.5)
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#valores extremos para las variables independientes 
#(predictoras)
#identificativo de fila
fila=1:22

#calculo de los valores de influencia (leverage)
influencia=hatvalues(r)

#grafico para identificar influencias
plot(fila,influencia,type="h",pch=16,cex.lab=1.5,
     cex.axis=1.5,lwd=4,xaxt="n",ylim=c(0,0.6))
axis(1,at=seq(0,22,by=4),cex.axis=1.5)
abline(h=2*mean(influencia),col="red",lty=2,lwd=4)

#valores extremos para la dependiente

ref=qt(0.975,22-2-1)
fila[abs(res)>ref]

#influencia sobre valores pronosticados
d=dffits(r)
b=dfbeta(r)

#valores en los individuos:
efecto=data.frame(fila,b[,-1],d)
efecto[c(7,9,15) ,]
