[library(ggplot2)
theme_set(
  theme_classic() +
    theme(legend.position = "top")
)

calcul_a <- function (x, y, x_mean, y_mean, size){
  xy_val <- 0
  x_carree <- 0
  r <- 0
  size <- length(x)
  
  for (i in 1:size){
    r <- x[i] *y[i]
    xy_val <- xy_val + r
    x_carree <- x_carree + (x[i] * x[i])
  }
  xy_mean <- xy_val / size
  x_carree_mean <- x_carree / size
  
  a <- (xy_mean - (x_mean * y_mean)) / (x_carree_mean - (x_mean * x_mean))
  return(a)
}
calcul_b <- function (x_mean, y_mean, a){
  b <- y_mean - (a * x_mean)
  return(b)
}

moindre_carre <- function (x, y){
  x_mean <- mean(x)
  y_mean <- mean(y)
  
  a <- calcul_a(x, y, x_mean, y_mean, size)
  b <- calcul_b(x_mean, y_mean, a)
  return(c(a,b))
}

x <- c(4, 3, 5,22, 3, 4, 6, 21, 2, 4, 6, 24, 3, 4, 7, 26)
y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)

df <- data.frame(Dinde=x,
                 Trimestre=y)
head(df, 4)

p <- ggplot(data = df, aes(x = Trimestre, y = Dinde, group = 1)) 
p + geom_line(linetype = "dashed", color = "steelblue")+
  geom_point(color = "steelblue")

q <- ggplot(df, aes(x=Dinde)) + geom_histogram()
q

#STEP 2
tt <- moindre_carre(y, x)

print(tt)

plot(y, x, col="blue", type="l")
abline(tt[2], tt[1], col = "red", type="l")

#STEP 3
MoyenneMobile <- c(0, 0)

for (i in 3:14){
  m <- 1/8*( x[i-2] + 2*x[i-1] + 2*x[i] + 2*x[i+1] + x[i-2] )
  MoyenneMobile <- c(MoyenneMobile, m)
}

MoyenneMobile <- c(MoyenneMobile, 0)
MoyenneMobile <- c(MoyenneMobile, 0)
print(MoyenneMobile)

Tendance = c()
for (i in 1:16) {
  t = tt[1] *i + tt[2]
  Tendance <- c(Tendance, t)
}
print(Tendance)

plot(y, MoyenneMobile, col="blue", type="l")
lines(y, Tendance, col='green')

DS <- c(0, 0)
for (i in seq(3,14)) {
  ds <- x[i] / MoyenneMobile[i]
  DS <- c(DS, ds)
}
DS <- c(DS, 0)
DS <- c(DS, 0)

print(DS)

plot(y, DS, col="blue", type="l")