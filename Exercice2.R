
tab_e <- rbind(c(-6, -3, 6, 1),
                  c(-1, 2, 1, -6), 
                  c(3, 6, 3, -2),
                  c(6, -3, 6, -1),
                  c(2, -1, 2, 3),
                  c(-3, 6, 3, 2),
                  c(-2, -1, 2, -3),
                  c(1, 2, 1, 6)) 

t_m <- matrix(c(-6, -1, 3, 6, 2, -3, -2, 1, -3, 2, 6, -3, -1, 6, -1, 2, 6, 1, 3, 6, 2, 3, 2, 1, 1, -6, -2, -1, 3, 2, -3, 6), 8,4)


#tab_e <- as.table(tab_e)
tab_e



# Question 3
tab_transpose <- t(tab_e)

t <- tab_transpose * tab_e
t

for (i in 1:4){
  norm(t_m[i])
}
