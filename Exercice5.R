library(ggplot2)

A = rbind(c(4, 3, 5,22), 
          c(3, 4, 6, 21),
          c(2, 4, 6, 24) ,
          c(3, 4, 7, 26))

xlabel <- "year"
ylabel <- "Trimestre"

plot(A,"l",xlabel,ylabel)