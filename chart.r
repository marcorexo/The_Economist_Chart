# Import the ggplot2 data.table libraries and use fread to load the csv file 
# 'Economist_Assignment_Data.csv' into a dataframe called df (Hint: use drop=1 to 
# skip the first column)
library(ggplot2)
library(ggthemes)
library(data.table)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

df <- fread("Economist_Assignment_Data.csv", drop = 1)


# Change the points to be larger empty circles. 
pl <- ggplot(df, aes(x=CPI, y=HDI))
pl2 <- pl + geom_point(aes(color=Region), size = 4, shape=1, na.rm = T) + geom_text(aes(label = Country), color = "gray20", 
                                                                                    data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE) 
pl3 <- pl2 + scale_x_continuous(limits = c(0.9,10.5), breaks = 1:10)
pl4 <- pl3 + geom_smooth(aes(group=1), method = 'lm', color = 'red', se = FALSE, formula = y ~ log(x)) 
pl4 + ggtitle("Corruption and Human Development") + theme_economist_white() + theme(plot.title = element_text(hjust = 0.5))











