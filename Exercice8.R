install.packages("ggcorrplot")                      # Install ggcorrplot package
library("ggcorrplot")                               # Load ggcorrplot

dataframe <- read.csv("donnees/base_conso.csv", header = TRUE, sep = ";") # 
#
# views the data frame formed from the csv file
#View(dataframe)

#dataframe[is.na(dataframe)] <- 0
#dataframe[x] <- as.numeric(dataframe[x]) 

sapply(dataframe, class) 

cols <- names(dataframe) %in% c('individus')

df <- dataframe[!cols]

#dataframe[is.na(dataframe)] <- 0

#data$x1 <- as.numeric(as.character(data$x1))

#data_coor <- round(cor(dataframe),2)
data_coor <- round(cor(df),2)
#data_coor

corr_plot <- ggcorrplot(
  data_coor,
  method = "square",
  type="full",
  hc.order=TRUE,
  lab=TRUE,
  lab_size=3,
  colors=c("red", "white", "red"),
  title="Matrice de corrélation",
  ggtheme=theme_bw
)

corr_plot