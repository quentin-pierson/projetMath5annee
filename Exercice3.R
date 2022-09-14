
A = rbind(c(-18, 13, -4, 4), c(2, 19, -4, 12),
           c(-14, 11, -12, 8) ,c(-2, 21, 4, 8))

A_svd = svd(A)
A_svd

"----------"
print("V")

ATA <- t(A) %*% A
ATA

ATA.e <- eigen(ATA)
v.mat <- ATA.e$vectors
v.mat


v.mat[,1:2] <- v.mat[,1:2] * -1
v.mat

print("U")
AAT <- A %*% t(A)
AAT

AAT.e <- eigen(AAT)
u.mat <- AAT.e$vectors
u.mat

r <- sqrt(ATA.e$values)
r <- r * diag(length(r))[,1:3]
r

svd.matrix <- u.mat %*% r %*% t(v.mat)
svd.matrix


"------------------"

https://rpubs.com/aaronsc32/singular-value-decomposition-r


"-----------"

B = rbind(c(-6, -8, 4, 5, 4), c(2, 7, -5, -6, 4),
          c(0, -1, -8, 2, 2) ,c(-1, -2, 4, 4, -8))

B

B_svd = svd(B)
B_svd