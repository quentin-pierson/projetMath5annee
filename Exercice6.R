library(ggplot2)

theme_set(
  theme_classic() +
    theme(legend.position = "top")
)

calcul_a <- function (x, y, x_mean, y_mean, size){
  xy_val = 0
  x_carree <- 0
  r <- 0
  size <- length(x)

  for (i in 0:size){
    r <- x[i] *y[i]
    xy <- xy_val + r
    print("---1---")
    print(r)
    print(xy)
    print("---2---")
    print(" ")
    x_carree <- x_carree + (x[i] * x[i])
  }
  xy_mean <- xy_val / size
  x_carree_mean <- x_carree / size
  
  print("-----")
  print(y_mean)
  print(x_mean)
  print(xy_val)
  print(xy_mean)
  print(x_carree_mean)
  print("-----")
  
  
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
x <- c(172, 298, 611, 122, 254, 414, 795, 198, 300, 472, 903, 265, 466, 568, 1115, 290, 352, 624, 1274, 303)
y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
df <- data.frame(ann=x,
                 Trimestre=y)
head(df, 4)

tt <- moindre_carre(x, y)

print(tt[0])

p <- ggplot(data = df, aes(x = Trimestre, y = ann, group = 1)) 
p + geom_line(linetype = "dashed", color = "steelblue")+
  geom_point(color = "steelblue") + geom_abline(intercept = 20, slope = 1)+
  ggtitle("name")

q<- ggplot(df, aes(x=ann)) + geom_histogram()
q