#construccion de los residuos
r=lm(F~P2)
#residuos
res=residuals(r)
#residuos estandarizados
res1=rstandard(r)
#residuo estudentizado
library(MASS)
res2=studres(r)

#analisis de las hipótesis
#gráfico comportamiento
par(mfrow=c(2,1))
plot(P2,res1,main="residuo estandarizado",ylim=c(-3,3),pch=16,cex=1.5,cex.lab=1,cex.axis=1)
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)
plot(P2,res2,main="residuo estudentizado",ylim=c(-3,3),pch=16,cex=1.5,cex.lab=1,cex.axis=1)
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)


