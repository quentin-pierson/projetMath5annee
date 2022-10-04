
dataframe <- read.csv("donnees/base_conso.csv", header = TRUE, sep = ";") # 
#
# views the data frame formed from the csv file
#View(dataframe)

#dataframe[is.na(dataframe)] <- 0
dataframe <- as.numeric(dataframe) 

data_coor <- cor(dataframe)
data_coor