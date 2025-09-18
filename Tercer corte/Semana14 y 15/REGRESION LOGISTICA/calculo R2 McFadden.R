x=7
a=Solea[x]
attach(a)


#calculo R2 McFadden

#ajuste del modelo de interes
r=glm(Solea_solea~salinity,family=binomial)

#ajuste del modelo solo con intercepto 
r0=glm(Solea_solea~1,family=binomial)

#calculo
1-(logLik(r)/logLik(r0))
