#la bibloteca car tambien calcula los residuos
library(car)

r=lm(colesterol~peso+edad)

#analisis de las variables independientes
#calculo de los valores de influencia (leverage)
influencia=hatvalues(r)

#paciente identifica la fila
plot(paciente,influencia,type="h",pch=16,cex.lab=1.5,
     cex.axis=1.5,lwd=4,xaxt="n")
axis(1,at=seq(0,13,by=1),cex.axis=1.5)
abline(h=0.5,col="red",lty=2,lwd=4)

#visualizo el fuera de rango

influencia[11]
problema2[11,c(2,3,4)]

#análisis de la variable dependiente

#el residuo estudentizado
#el paquete car calcula los residuos
resE=rstudent(r)
#análisis de los residuos extremos
ref=qt(0.90,13-2-1)
paciente[abs(resE)>ref]

#influencia sobre valores pronosticados
#calculo de dfits para cada individuo
d=dffits(r)

#calculo de dbetas para cada individuo
b=dfbeta(r)

efecto=data.frame(b,d)

