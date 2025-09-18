attach(stopping)
Speed2=Speed^2
r=lm(Distance~Speed+Speed2,weights=1/Speed2)
#distancia estimada
1.56+0.4196*23+0.0655*(23^2)


