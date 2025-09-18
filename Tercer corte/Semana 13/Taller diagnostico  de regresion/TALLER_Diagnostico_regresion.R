attach(nyc)
head(nyc)
l = lm(Price~Food+Decor+Service+East)
library(car)



res=rstudent(l)
# RESIDUOS ESTANDARIZADOS 
res
#Fest=fitted(r) como solo es una variable no es necesario
summary(l)
#grafico residuos. Hipótesis

vif(l)

res1=rstandard(l)





plot(Price,res1,main="residuo estandarizado",ylim=c(-3,3)
     ,pch=16,cex=1.5,cex.lab=1.5,cex.axis=1.5)
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)

library(MASS)
res2 =studres(l)


plot(Price,res2,main="residuo estudentizado",ylim=c(-3,3)
     ,pch=16,cex=1.5,cex.lab=1.5,cex.axis=1.5)
abline(h=2,col="red",lwd=2,lty=2)
abline(h=-2,col="red",lwd=2,lty=2)
abline(h=0,col="blue",lwd=2,lty=2)


influencia=hatvalues(l)

#valores extremos para las variables independientes 
#(predictoras)
#identificativo de fila
fila=1:168


#grafico para identificar influencias
plot(fila,influencia,type="h",pch=16,cex.lab=1.5,
     cex.axis=1.5,lwd=4,xaxt="n",ylim=c(0,0.6))
axis(1,at=seq(0,168,by=4),cex.axis=1.5)
abline(h=2*mean(influencia),col="red",lty=2,lwd=4)

#valores extremos para la dependiente
# -2 es la cantidad de variabñes
ref=qt(0.975,168-4-1)
fila[abs(res)>ref]

#influencia sobre valores pronosticados
d=dffits(l)
b=dfbeta(l)

#valores en los individuos:
efecto=data.frame(fila,b[,-1],d)
efecto[c(30,45,48,56,83,103,109,130,132,141,165) ,]
2*sqrt(3/168)
2/(sqrt(168))


influencia[4]
nyc[4,c(1:7)]

res2[130]

d[130]
