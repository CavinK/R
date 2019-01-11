library(devtools)
install_github('ramnathv/rCharts')

require(rCharts)
names(iris) <- gsub("\\.","",names(iris))
View(iris)
rPlot(PetalLength ~ PetalWidth | Species, data = iris, color = 'Species', type = 'point')

hair_eye <- as.data.frame(HairEyeColor)
rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')

r1 <- rPlot(mpg ~ wt | am + vs, data = mtcars, type = 'point', color = 'gear') ; r1

data(economics, package = 'ggplot2')
econ <- transform(economics, data = as.character(date))
m1 <- mPlot(x = 'date', y = c('psavert','uempmed'), type = 'Line', data = econ)
m1$set(pointSize = 0, lineWidth = 1) ; m1

hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = 'multiBarChart') ; n1

require(reshape2)
uspexp <- melt(USPersonalExpenditure)
names(uspexp)[1:2] <- c('category', 'year')
x1 <- xPlot(value ~ year, group = 'category', data = uspexp, type = 'line-dotted') ; x1
