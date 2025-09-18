attach(adm)
head(adm)

rangoF = factor(rango)
contrasts(rangoF)
r = glm(admit ~ exam + prom + rangoF, family = "binomial")
summary(r)
r0 = glm(admit~ 1, family = binomial )

do= 499.98-458.52
do
1-pchisq(do,3)


1-(logLik(r)/logLik(r0))
a = adm[,2:4]
prob=predict(r,a,type="response")
clasif = numeric(length(prob))

for(i in 1:length(prob)) { clasif[i]=ifelse(prob[i]>0.5, 1, 0)}




T=table(admit, clasif)
T

length(prob)
(254+30)/400


predict(r,a, type="response")
a = data.frame(exam=400,prom=3, rangoF="4")
predict(r,a, type="response")




attach(premios)
head(premios)

progF = factor(prog)
contrasts(progF)

r = glm(num ~ progF+mat, family=poisson)
summary(r)

r0 = glm(num ~ 1,family = poisson())
1 -(logLik(r)/logLik(r0))


do = 287.67 - 189.45

1-pchisq(do,2)



a=data.frame(progF="2",mat=43)
predict(r,a,type="response")

dpois(2,0.317)
