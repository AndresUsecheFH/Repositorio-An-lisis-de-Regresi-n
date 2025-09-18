#Base de datos 01 Solea
#Analizar si las variables temperature (tempertura del agua) y 
#salinity (salinidad)
#influyen sobre la selección de la zona como sitio de 
#crianza del lenguado
#variable dependiente Solea:solea (dicotómica 1:selecciona / 0: no
#selecciona)

#ajuste del modelo de regresion
attach(Solea)
r=glm(Solea_solea~temperature+salinity,family=binomial)
#visualización
summary(r)

#estimacion por intervalos de confianza
#el análisis igual que en la regresion lineal
confint(r,level=0.99)

#ajuste solo con salinidad

attach(Solea)
r=glm(Solea_solea~salinity,family=binomial)
#visualización
summary(r)
I=confint(r,level=0.99)
I

#IC para la RPC
exp(I[2,1])
exp(I[2,2])

#prob estimada

#paso 1:
#hacer un marco de datos con los valores de la var indep
#en los que se desea hacer el pronóstico
a=data.frame(salinity=32)
predict(r,a,type="response")

#para todos los estuarios
#posición de salinity 7, hago el marco de datos solo con ella
x=7
a=Solea[x]
prob=predict(r,a,type="response")

#clasificación (discriminación)
clasif=numeric(length(prob))
for(i in 1:65) {clasif[i]=ifelse(prob[i]>0.5,1,0)}

#concordancias
T=table(Solea_solea,clasif)
round(prop.table(T),2)
#calculo R2 McFadden

#ajuste del modelo de interes
r=glm(Solea_solea~salinity,family=binomial)

#ajuste del modelo solo con intercepto Solea_solea~1,family=binomial)
r0=glm(Solea_solea~1,family=binomial)

#calculo
1-(logLik(r)/logLik(r0))