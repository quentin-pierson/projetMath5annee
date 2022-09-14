library(pracma)


A = rbind(c(-3, -3, -6, 6, 1), c(-1, -1, -1, 1, -2),
          c(0, 0, -1, 1, -1) ,c(0, 0, 1, 1, -1))

B = rbind(c(-4, 0,-1,-20), c(-5,0,3,5,0),
          c(2,0,-1,-2,0) ,c(6,0,-3,-6,0))

#Question 1 
pinv(A)
pinv(B)

# Question 2
b = matrix(c(6, -1,-4 ,6))

xA = pinv(A) %*% b
xA

# Question 3
xB = pinv(B) %*% b
xB