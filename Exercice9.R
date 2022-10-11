# Partie 1 
# 14 > 10 expliquer pourquoi 
dftestCHI2 <- read.csv(file = 'data/ex9_chi2.csv', sep=";", header = TRUE, row.names = 1)
head(dftestCHI2)

chisq.test(dftestCHI2)

library(FactoMineR) 
library(factoextra)

# Dataframe 
df <- read.csv(file = 'data/ex9_antal.csv', sep=";", header = TRUE, row.names = 1)
head(df)

res.ca <- CA(df, ncp = 3, graph=TRUE)
summary(res.ca)
print(res.ca)

fviz_ca_biplot(res.ca, repel = TRUE) # Affiche le premier plan principal


print(res.ca$eig) # valeur propre 

print("Col")
print(res.ca$col$coord) # Coord colonnes
print(res.ca$col$contrib) # Contri colonnes (%)
print(res.ca$col$cos2 * 100 )  # Qualite des colonnes 

print("Row")
print(res.ca$row$coord)  # Coord ligne


fviz_screeplot(res.ca, addlabels = TRUE)



print("Quality of representation of rows")
head(res.ca$row$cos2 * 100)  # Qualite ligne 
fviz_ca_row(res.ca, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)

library("corrplot")

# COS 2 row 
corrplot(res.ca$row$cos2, is.corr=FALSE)


# Contribution row
head(res.ca$row$contrib)
corrplot(res.ca$row$contrib, is.corr=FALSE)    

fviz_contrib(res.ca, choice = "row", axes = 1, top = 10) # Contributions of rows to dimension 1
fviz_contrib(res.ca, choice = "row", axes = 2, top = 10) # Contributions of rows to dimension 2
fviz_contrib(res.ca, choice = "row", axes = 3, top = 10)# Contributions of rows to dimension 3

# Total contribution to dimension 1-3
fviz_contrib(res.ca, choice = "row", axes = 1:3, top = 10)
