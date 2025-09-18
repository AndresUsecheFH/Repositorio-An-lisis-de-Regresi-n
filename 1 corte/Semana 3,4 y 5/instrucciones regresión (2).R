#visualización diagrama x-y
plot(lluvia,contam,xlab="contaminación",ylab="cant lluvia",pch=16,cex=2,cex.lab=1.5,cex.axis=1.5)

#instrucciones regresión
r=lm(contam~lluvia)

#visualización de la recta en la nube de puntos
#explicacion
#lwd (ancho de la linea) #col (color de la linea)
abline(r,lwd=3,col="red")

#para visualizar las estimaciones
summary(r)

#para la tabla de ANOVA
anova(r)

#´para el intervalo de confianza
confint(r,conf.level=0.99)

