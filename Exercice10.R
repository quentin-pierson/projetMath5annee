library("gplots")
library("readr")
library("factoextra")
library ("FactoMineR")
library("corrplot")

dataframe_election <- read.csv("donnees/election.csv", header = TRUE, sep = ";", check.names = F, row.names = 1) # 
dataframe_election

dt <- as.table(as.matrix (dataframe_election))

balloonplot(t (dt), main = "election", xlab = "", ylab = "",
            label = FALSE, show.margins = FALSE)

#---TEST KHI2---
# On évalue si il y a une dépendance signicative 
# entre les colonnes et les lignes

chisq <- chisq.test (dataframe_election)
chisq

# Statistiques de khi2
chi2 <- 1944.456

df <- (nrow (dataframe_election) - 2) * (ncol (dataframe_election) - 2)

pval <- pchisq (chi2, df = df, lower.tail = FALSE)
pval

res.ca <- CA (dt, graph = FALSE)
print(res.ca)

eig.val <- get_eigenvalue (res.ca)
eig.val

fviz_screeplot (res.ca) +
  geom_hline (yintercept = 33.33, linetype = 2, color = "red")

fviz_ca_biplot (res.ca, repel = TRUE)

row <- get_ca_row(res.ca)
row

head(row$coord)
# Cos2: qualité de représentation
head(row$cos2)
# Contributions 
head(row$contrib)

head(row$coord)

fviz_ca_row(res.ca, repel = TRUE)

fviz_ca_row (res.ca, col.row = "steelblue", shape.row = 15)
head(row$cos2, 4)

fviz_ca_row (res.ca, col.row = "cos2",
             gradient.cols = c ("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

fviz_ca_row (res.ca, alpha.row = "cos2")
corrplot(row$cos2, is.corr = FALSE)




