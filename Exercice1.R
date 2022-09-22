#r = β + e(r cos Θ)
#β est une constante 
#e l'excentricité de l'orbite
#-------------------------------------
#Quand 0 <= e < 1, il s'agit d'une ellipse
#Quand e = 1
#d'une parabole et quand e > 1

#MS = 2,00 × 1030 kg
#G = 6,68 × 10-11 m3.kg-1.s-2

#Θ (en rad) = 0.88, 1.10, 1.42, 1.77, 2.14
#r (*10 UA) = 3.00, 2.30, 1.65, 1.25, 1.01

tab_teta <- matrix(c(0.88, 1.10, 1.42, 1.77, 2.14), ncol=5, byrow=TRUE)
rownames(tab_teta) <- c('Θ (en rad)')
                   
tab_r <- matrix(c(3.00, 2.30, 1.65, 1.25, 1.01), ncol=5, byrow=TRUE)
rownames(tab_r) <- c('r (*10 UA)')

tab_teta <- as.table(tab_teta)
tab_r <- as.table(tab_r)

q = seq(from = 0, to = 2, by = 0.01)

tab_e <- matrix(q , ncol=length(q), byrow=TRUE)
rownames(tab_e) <- c('e')
tab_e <- as.table(tab_e)

#INSTALL THIS => REdaS
#formule :  β = r - e(r cos Θ)

#for (i in 0:5){
#  t = tab_teta[i]
#  r = tab_r[i]
  
#  for (e in tab_e){
#    beta <- r - e * (r * cos(t))
#    print(beta)
#  }
#}

#e <- 0.810
#B <- 14.511
#a <- 76.374 
#b <- 14.511
e <- 19.9/(-10.1*cos(2.14)+30*cos(0.88))
B <- 30 - e*(30*cos(0.88))

a <- B/(1-e*cos(0))
b <- B/(1-e*cos(pi/2))



t <- seq(from = 0, to = 2*pi, by = 0.01)

x <- B/(1-e*cos(t))*cos(t)
y <- B/(1-e*cos(t))*sin(t)
plot(x,y, pch=19, col='blue')




