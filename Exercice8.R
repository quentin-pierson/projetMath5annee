install.packages("ggcorrplot")                      # Install ggcorrplot package
library("ggcorrplot")                               # Load ggcorrplot

dataframe <- read.csv("donnees/base_conso.csv", header = TRUE, sep = ";") # 
#
# views the data frame formed from the csv file
#View(dataframe)

#dataframe[is.na(dataframe)] <- 0
#dataframe[x] <- as.numeric(dataframe[x]) 

#sapply(dataframe, class) 

cols <- names(dataframe) %in% c('individus')

df <- dataframe[!cols]

#dataframe[is.na(dataframe)] <- 0

#data$x1 <- as.numeric(as.character(data$x1))

#data_coor <- round(cor(dataframe),2)
data_coor <- round(cor(df),2)
#data_coor

#ggcorrplot(cor(data_coor))   

corr_plot <- ggcorrplot(
  data_coor,
  type=c("upper"),
  hc.order=TRUE,
  lab=TRUE,
  lab_size=2,
  title="Matrice de corrélation"
)

corr_plot