attach (diab)
head(diab)

r =glm(Tipo ~ PR + RI + PG, family="binomial")
summary(r)
do= 95.52-34.15
do
1-pchisq(do,3)
confint(r,level=0.95)

r0=glm(Tipo~1,family=binomial)



#calculo
1-(logLik(r)/logLik(r0))


a=diab[,1:3]
prob=predict(r,a,type="response")
clasif=numeric(length(prob))
for(i in 1: length(prob)) {clasif[i]=ifelse(prob[i]>0.5,1,0)}
T=table(Tipo,clasif)
T
#EXPLICACION

length(prob)
(29+35)/69

#caso puntual prediccion

a = data.frame(RI=200,PG=150, PR=1)
predict(r,a,type="response")

a=data.frame(PR,RI,PG)
predict(r,a,type = "response" )
