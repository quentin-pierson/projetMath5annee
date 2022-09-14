library(ggplot2)
theme_set(
  theme_classic() +
    theme(legend.position = "top")
)

df <- data.frame(ann=c(4, 3, 5,22, 3, 4, 6, 21, 2, 4, 6, 24, 3, 4, 7, 26),
                 Trimestre=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))
head(df, 4)

p <- ggplot(data = df, aes(x = Trimestre, y = ann, group = 1)) 
p + geom_line(linetype = "dashed", color = "steelblue")+
  geom_point(color = "steelblue")