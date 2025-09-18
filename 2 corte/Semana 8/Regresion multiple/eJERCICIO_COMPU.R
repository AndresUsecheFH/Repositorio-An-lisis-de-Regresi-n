attach(compu)
head(compu)
r = lm(IG ~ C + D)
summary(r)
cor.test(D,C)
# nO ESTAN CORRELACIONADAS

rC = lm(IG ~ C)
rD = lm(IG ~ D)

summary(rC)
summary(rD)

anova(rC,r)
#La variable C controlando d no aporto
anova(r)

