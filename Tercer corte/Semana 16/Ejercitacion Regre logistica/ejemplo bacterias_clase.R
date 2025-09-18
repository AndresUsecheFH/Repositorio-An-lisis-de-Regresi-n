attach(bacterias)
#ajuste del modelo
r=glm(n~t,family=poisson)
summary(r)
#estimacion de los valores variable dependiente
n_E=predict(r,bacterias,type="response")

#grafico comparando
plot(t,n,pch=16,cex=1.5,cex.axis=1.5,cex.lab=1.5,col="black")
points(t,n_E,pch=16,cex=1.5,col="red")
lines(t,n_E,lwd=4,col="red")

legend(12,330,title="valores",legend=c("datos", "ajustado"),
       col=c("black", "red"), lty=1.2, cex=1)

#intervalos de confianza
confint(r,level=0.99)

#Calculo R2 McFadden
#modelo que se ajusta
r=glm(n~t,family=poisson)

#modelo con intercepto
r0=glm(n~1,family=poisson)

#calculo
#Observe que en las desviaciones:
#LV0: se calcula con logLik(r0)
#LVM: se calcula con logLik(r)

1-(logLik(r)/logLik(r0))

