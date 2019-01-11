lotto <- read.csv("C://data/649.csv")
View(lotto)
lotto2 <- lotto[,c(-1,-2,-3)]
View(lotto2)
str(lotto2)
colnames(lotto2) <- c('Date','1st','2nd','3rd','4th','5th','6th','Bonus')
View(lotto2)

lotto3 <- read.csv("C://data/lotto.csv")
View(lotto3)
