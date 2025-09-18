#basado en los datos que se encuentran en en archivo datos clase

#diagrama x-y: caso dos variables

#explicación: 
#pch (símbolo de los puntos) /cex (tamaño de los puntos)
#cex.lab (tamaño letras ejes) /cex.axis (tamaño numeros de los ejes)
#xlim y ylim (rango de valores a considerar en los ejes)

plot(contam,lluvia,xlab="contaminación",ylab="cant lluvia",pch=16,cex=2,
     cex.lab=1.5,cex.axis=1.5)

#diagrama x-y: gráficos con multiples variables

#se puede usar la función plot ingresando un marco de datos
#los comandos que forman la instrucción son los mismos

plot(P,pch=16,cex=1.5,cex.axis=1.5,labels=c("precio","confort","capacidad"))


