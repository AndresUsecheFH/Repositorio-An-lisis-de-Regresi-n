

#análisis de correlaciones. usando archivo datos clase
#calculo de correlaciones
#method=" " pearson o spearman

cor(contam,lluvia, method="pearson")

#si tengo una matriz de datos o un data.frame puedo calcular con el 
#comando la matriz de correlaciones

cor(P,method="spearman")

#Para hacer pruebas de hipótesis e IC
cor.test(contam,lluvia,method="pearson",conf.level = 0.99)

#el IC spearman no lo calcula el comando
#cargar el paquete RVAideMemoire
#utiliza método Bootstrap (estadística computacional) nrep(numéro de repeticiones del proc) 
spearman.ci(contam,lluvia,nrep=1000,conf.level=0.99)

#Para trabajar específicamente con el coeficiente de Pearson
#Paquete corrplot

#para hacer la prueba de hipótesis e IC
#datos en data frame o matriz de datos

# deposito el resultado en T para usarlo más adelante (otro procedimiento)
T=cor.mtest(PM,conf.level=0.99)
#salidas
#T$p: valores p
#T$lowCI: limite inferior IC
#T$uppCI: limite superior IC
T

#Para hacer el correlograma (gráfico conjunto de correlaciones)
#Necesito la matriz de correlaciones: la calculo con cor(P)
#necesito los valores-p de la prueba : la calculo con T=cor.mtest(PM,conf.level=0.99)

#correlograma
#explicacion: 
#addCoef.col=" " (colores letras con coeficientes)
#tl.col =" " (colores nombre variables)
#cl.ratio = (tamaño de la leyenda)

corrplot(cor(P),p.mat=T$p,sig.level=0.05/3,type="upper",diag=FALSE,addCoef.col = "black",tl.col = "black",cl.ratio = 0.3)

