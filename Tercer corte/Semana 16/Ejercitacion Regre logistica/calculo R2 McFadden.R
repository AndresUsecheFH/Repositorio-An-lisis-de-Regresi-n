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







attach(malaria)

r=glm(mal~age+ab,family = binomial)
r0=glm(mal~1,family = binomial)

summary(r)
confint(r, level = 0.99)


1-pchisq(10.75,2)

1-(logLik(r)/logLik(r0))

a=malaria[,2:3]
prob=predict(r, a, type = "response")

clasif=numeric(length(prob))

for(i in 1:length(prob)) {
  clasif[i]=ifelse(prob[i]>0.5, 1, 0)
}
T=table(mal, clasif)
T
library(readxl)

data=read_excel("C:/Users/sala203/Downloads/05 diabetes.xlsx")

head(data)


attach(data)
r=glm(Tipo~PR+RI+PG, family = binomial)
summary(r)

PR=1
RI=200
PG=150
a=data.frame(PR,RI,PG)
predict(r,a,type = "response" )










