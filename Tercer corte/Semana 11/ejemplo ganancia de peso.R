X=numeric(0)
Y=numeric(0)
data.entry(X,Y)
plot(X,Y,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)

r=lm(Y~X)

#visualizacion de que no hay linealidad
plot(X,rstandard(r),pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#Propuesta
#regresion Y,X
r=lm(Y~X)
#residuo, comportamiento de Y que no 
#alcanza a explicarse con X
resY=residuals(r)

#anadir termino cuadratico
X2=X^2

#cuanto de lo que no explico X
#se encuentra en X2
r1=lm(X2~X)
resX2=residuals(r2)
#relacion
plot(resX2,resY,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)



#analisis del nuevo modelo
r3=lm(Y~X+X2)
summary(r3)
anova(r,r3)

#otra forma de modelar
Y2=sqrt(Y)
r4=lm(Y2~X)
summary(r4)

#grafico
par(mfrow=c(2,1))
plot(X,Y,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)
plot(X,Y2,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)