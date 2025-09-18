attach(droga)

head(droga)# 1 si recibio droga B , 0 droga G
head(tiempo)
r = lm(tiempo ~ droga)
summary(r)
#P VALOR < 0.05 SE OBSERVAN DIFERENCIAS EN EL TIEMPO MEDIO DE CUAGULACION

confint(r)
#1.722 < B1 < 3.877 LA CUAGULACIÓN ES MAYOR DE 1.722 A 3.877PARA
#LOS QUE RECIBIERON LA DROGA B

mean(tiempo[droga==1])
mean(tiempo[droga==0])
