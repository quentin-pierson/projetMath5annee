library(ggplot2)
theme_set(
  theme_classic() +
    theme(legend.position = "top")
)

df <- data.frame(ann=c(172, 298, 611, 122, 254, 414, 795, 198, 300, 472, 903, 265, 466, 568, 1115, 290, 352, 624, 1274, 303),
                 Trimestre=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20))
head(df, 4)

p <- ggplot(data = df, aes(x = Trimestre, y = ann, group = 1)) 
p + geom_line(linetype = "dashed", color = "steelblue")+
  geom_point(color = "steelblue")