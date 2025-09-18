r1=lm(y~x1+x2)
library(MASS)
yest=fitted(r1)
res1=studres(r1)

plot(yest,res1,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#opcion 1 transformar y
yt=sqrt(y)
r2=lm(yt~x1+x2)
ytest=fitted(r2)
res2=studres(r2)
plot(y2est,res2,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#regresion X1, y
r3=lm(y~x1)
y3=fitted(r3)
res3=studres(r3)
plot(x1,res3,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#regresion x2, y
r4=lm(y~x2)
y4=fitted(r4)
res4=studres(r4)
plot(x2,res4,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

#diagramas xy conjuntos
par(mfrow=c(2,1))
plot(x1,y,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)
plot(x2,y,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)

#regresion x1 con x2
r5=lm(x1~x2)
res5=studres(r5)
plot(res5,res4,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5)

#la propuesta
x12=x1^2
r6=lm(y~x2+x1+x12)
summary(r6)
anova(r6)

#valoremos las hipótesis con la propuesta final

y_est_final=fitted(r6)
res6=studres(r6)
plot(y_est_final,res6,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,ylim=c(-3,3))
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)









