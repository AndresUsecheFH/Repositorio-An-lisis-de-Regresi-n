
#datos
#fertilizantes experimentales
A
B
#fertilizantes de control
C

#visualizacion
z=list("A"=A,"B"=B,"C"=C)
stripchart(z,method="jitter",pch=16,cex=2,xlab="rendimiento",
      ylab="fertilizante",cex.axis=1.5,cex.lab=1.5,col=c("red","blue","black"))

# construccion del modelo con
# la variable cualitativa

#variable de respuesta
Y=c(C,B,A)

#variable cualitativa X, categorias (A,B,A)
#representadas por los valores 1,2,3
# valor de referencia 1

X=c(rep(1,10),rep(2,10),rep(3,10))

#se construye un factor para ingresar las 
#variables cualitativas al modelo.
#el sistema considera la categoría más pequeña
#como la referencia

f=factor(X)

summary(lm(Y~f))

#1. Intercepto:
#  Estimate = 22.95
#→ Este es el promedio del grupo C (control).

#2. f2 (B vs C):
#  Estimate = 7.13
#→ El grupo B tiene 7.13 unidades más de rendimiento que el control (C).

#p < 0.001 → Diferencia estadísticamente significativa.

#3. f3 (A vs C):
#  Estimate = 16.39
#→ El grupo A tiene 16.39 unidades más de rendimiento que el control (C).

#También muy significativo (p < 0.001).


#Ese p-valor individual responde a esta pregunta:
  
 # ¿Es significativo el efecto de esta variable sobre Y, manteniendo constantes las demás?

confint(lm(Y~f),label=0.99)
#Comparación	Límite inferior	Límite superior	Interpretación
#C (Intercepto)	21.68	24.22	Rendimiento promedio del grupo control
#B - C	5.34	8.92	B es significativamente mejor que C
#A - C	14.60	18.18	A es mucho mejor que C
