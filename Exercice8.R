# Chargement des librairies
library("FactoMineR")
library("factoextra")
library("ggcorrplot")
library(ggplot2)

full_dataframe <- read.csv("donnees/base_conso.csv", header = TRUE, sep = ";") 

# Définition des partitions des individus
age_range = c(1,2,3,4,5,6,7)
decile_range = c(9,10,11,12,13,14,15,16,17,18)

age_range_dataframe = full_dataframe[age_range,]
decile_dataframe = full_dataframe[decile_range,]

#decile_dataframe

#########################
#########################


# Graphe basique
#p <- ggplot(decile_dataframe, aes(x=decile_range)) + geom_density()
#q <- ggplot(age_range_dataframe, aes() + geom_density())
#p
#q

cols <- names(decile_dataframe) %in% c('individus')
df <- decile_dataframe[!cols]

decile_dataframe_no_ind <- cor(df)


decile_dataframe.pca = PCA(decile_dataframe_no_ind)

plot(decile_dataframe.pca)


#########################
#########################

# Faire un dataframe de toutes les données
# Faire un dataframe des données par tranches d'âge
# Faire un dataframe des données par déciles


# Exclusion de la colonnes individus
cols <- names(full_dataframe) %in% c('individus')
df <- full_dataframe[!cols]

full_dataframe_coor <- cor(df)

full_dataframe_corr_plot <- ggcorrplot(
  full_dataframe_coor,
  type=c("upper"),
  hc.order=TRUE,
  lab=TRUE,
  lab_size=2,
  title="Matrice de corrélation"
)

full_dataframe_corr_plot