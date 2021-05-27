# 
library(ChainLadder)
RAA
cum2incr(RAA)
mack <- MackChainLadder(RAA, est.sigma="Mack")
mack
mack$f
plot(mack)

library("lifecontingencies")
showClass("lifetable")
showClass("actuarialtable")

AF92Lt
AF92At <- new("actuarialtable",x=AF92Lt@x, lx=AF92Lt@lx, interest=0.06, name="'Актуарная таблица: AF92'")
AF92At
Axn(actuarialtable=AF92At, x=25, n=10)
AF92AtDf <- as(AF92At, "data.frame")
(AF92AtDf$Mx[26] - AF92AtDf$Mx[36])/AF92AtDf$Dx[26]
