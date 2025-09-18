##base de datos semana 8 Datos_coagulación
attach(droga)
droga
r=lm(tiempo~droga)
summary(r)
confint(r)

mean(tiempo[droga==1])
mean(tiempo[droga==0])

##base de datos semana 8 Compu
attach(compu)
head(compu)

l=lm(IG~D+C)
summary(l)
cor.test(D,C)
l1=lm(IG~C)
anova(l1,l)


##base de datos semana 9 presión
attach(presion)
head(presion)
m=lm(pres~edad+sexc+sexed)
summary(m)

anova(m)

m1 = lm(pres~edad+sexc)

plot(edad,pres,xlab="edad",ylab="presion",pch=16,cex=2,cex.lab=1.5,cex.axis=1.5)


#visualización de la recta en la nube de puntos
#explicacion
#lwd (ancho de la linea) #col (color de la linea)
abline(m1,lwd=3,col="red")

presion
summary(m)
summary(m1)

# Ajustar modelos de regresión separados por sexo
m_hombres = lm(pres ~ edad, data = presion, subset = (sexc == 0))
m_mujeres = lm(pres ~ edad, data = presion, subset = (sexc == 1))

# Crear el gráfico base
plot(presion$edad, presion$pres, xlab = "Edad", ylab = "Presión Arterial",
     pch = 16, cex = 1.5, cex.lab = 1.5, cex.axis = 1.5, col = ifelse(presion$sexc == 0, "blue", "red"))

# Agregar las líneas de regresión
abline(m_hombres, col = "blue", lwd = 3)   # Línea azul para hombres
abline(m_mujeres, col = "red", lwd = 3)    # Línea roja para mujeres

# Agregar leyenda
legend("topleft", legend = c("Hombres", "Mujeres"), col = c("blue", "red"), lwd = 3, cex = 1.2)


exameness = as.data.frame(examenes)


##base de datos semana 9 Problemas multiple
attach(exameness)
head(exameness)

cor.test(P1,P2)


n=lm(F~P2+P1)
summary(n)
anova(n)

#P>0.01 POR LO TANTO P1 NO INFLUYE EN EL MODELO, POR ENDE EL MEJOR MODELO ES CON P2 SOLO

#ESTE ANALISIS SOLO SE USA CUANDO HAY MUCHAS VARIABLES

n1=lm(F~P2)
anova(n1,n)


r=lm(F~P2)

a = data.frame(P1=85,P2=78)
a

cbind(a,predict(r,a,interval="confidence",level=0.99))


##base de datos semana 9 Problemas multiple

attach(supervisor)
head(supervisor)

install.packages("corrplot")
library(corrplot)

correlation_matrix <- cor(supervisor)  # Calcula la matriz de correlación
corrplot(correlation_matrix, method = "circle")  # Usando círculos

m = lm(Y~X1+X2+X3+X4+X5+X6)
summary(m)

# P<0.01
#LAS VARIABLES EN CONJUNTO APORTAN AL MODELO

confint(m,level=0.99)



m1= lm(Y~X1+X2+X5)
summary(m1)
anova(m1)

#EN ESTE QUE SIGUE HAY COLINEALIDAD
cor.test(X3,X4)
m2 = lm(Y~X3+X4)
summary(m2)
anova(m2)

#aNALICE X6

cor.test(Y,X6)
0.155*0.155 # r al cuadrado
#EVALUE EÑ EFECTO CONJUNTO DE X2,X5 CONTROLANDO X1