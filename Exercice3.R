
A = rbind(c(-18, 13, -4, 4), c(2, 19, -4, 12),
           c(-14, 11, -12, 8) ,c(-2, 21, 4, 8))

A_svd = svd(A)
A_svd

svd_own <- function(A){
  print("U")
  AAT <- A %*% t(A)
  AAT.e <- eigen(AAT)
  u.mat <- AAT.e$vectors

  u.mat[,2:4] <- u.mat[,2:4] * -1
  
  print(u.mat)
  
  print("V")
  ATA <- t(A) %*% A
  
  ATA.e <- eigen(ATA)
  v.mat <- ATA.e$vectors
  
  v.mat[,2:4] <- v.mat[,2:4] * -1
  
  print(v.mat)
  
  r <- sqrt(ATA.e$values)
  r <- r * diag(length(r))
  
  print("R")
  print(r)
}

svd_own(A)

svd_own(B)
"------------------"

B = rbind(c(-6, -8, -4, 5, -4), c(2, 7, -5, -6, 4),
          c(0, -1, -8, 2, 2) ,c(-1, -2, 4, 4, -8))

B

B_svd = svd(B)
B_svd