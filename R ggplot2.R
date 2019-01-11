library(ggplot2)
View(mpg)
str(mpg)



# Basics 

## Scatter Plot(qplot)
qplot(x = cty, y = hwy, color = cyl, data = mpg, geom = "point")

## Scatter Plot(ggplot)
### ggplot(data, aes(columns))
ggplot(data = mpg, aes(x=cty, y=hwy)) + ## add layers
  geom_point(aes(color=cyl)) + 
  geom_smooth(method = "lm") + ### trend line
  coord_cartesian() +
  scale_color_gradient() +
  theme_bw() ### box

last_plot() ### returns the last plot
ggsave("plot.png", width = 5, height = 5) ### saves the last plot 



# Geoms(One Variables) 

## Continuous
aes(hwy) ### aesthetic mapping(x & y axis)
a <- ggplot(mpg, aes(hwy))

a + geom_area(stat="bin")
a + geom_density(kernel = "gaussian") ### flexible curve
a + geom_dotplot()
a + geom_freqpoly() ### strict freq line
a + geom_histogram(binwidth = 5)

## Discrete
b <- ggplot(mpg,aes(fl))
b + geom_bar()



# Graphical Primitives 
View(world.cities)
View(economics)
View(seals)
data()

install.packages("maps")
library(maps)
c <- ggplot(world.cities, aes(lat, long))
c + geom_polygon(aes(group = name))

d <- ggplot(economics, aes(date, unemploy))
d + geom_path(lineend = "butt", linejoin = "round", linemitre = 1) ### time-series style
d + geom_ribbon(aes(ymin = unemploy - 900, ymax = unemploy + 900)) ### actually the same as the above one 

e <- ggplot(seals, aes(x=long, y=lat))
e + geom_segment(aes(xend = long + delta_long, yend = lat + delta_lat)) ### group of short lines to describe the direction to a certain spot
e + geom_rect(aes(xmin = long, ymin = lat, 
                  xmax = long + delta_long, ymax = lat + delta_lat)) ### small boxes, instead of short lines



# Geoms(Two Variables)

## Continuous X, Continuous Y 
f <- ggplot(mpg, aes(cty, hwy)) ### two variables in aes()!
f + geom_blank() 
f + geom_jitter() ### scatter points randomly
f + geom_point() ### better-organised 

install.packages('quantreg')
library(quantreg)
f + geom_quantile()

f + geom_rug(sides = "bl") ### add detailed lines on the axes 
f + geom_smooth(model = lm) ### trend line with shades
f + geom_text(aes(label = cty)) ### input the actual data of the designated variable 

## Discrete X, Continuous Y 
g <- ggplot(mpg, aes(class,hwy))
g + geom_bar(stat = "identity")
g + geom_boxplot()
g + geom_dotplot(binaxis = "y", stackdir = "center")
g + geom_violin(scale = "area")

## Discrete X, Discrete Y 
View(diamonds)
h <- ggplot(diamonds, aes(cut, color))
h + geom_jitter() ### compare each block to figure out which baskets are highly frequent 

## Continuous Bivariate Distribution
install.packages("ggplot2movies")
library(ggplot2movies)
View(movies)
i <- ggplot(movies, aes(year, rating))
i + geom_bin2d(binwidth = c(5,0.5))
i + geom_density2d() ### geographical density map

install.packages("hexbin")
library(hexbin)
i + geom_hex() ### more delicate than geom_bin2d()

## Continuous Function
j <- ggplot(economics, aes(date, unemploy))
j + geom_area()
j + geom_line()
j + geom_step(direction = "hv") ### thicker line

## Visualising Error
df <- data.frame(grp = c("A","B"), fit=4:5, se=1:2)
k <- ggplot(df,aes(grp,fit,ymin = fit-se, ymax = fit+se))
k + geom_crossbar(fatten = 2) ### rectangles
k + geom_errorbar() ### "I" shaped lines
k + geom_linerange() ### just lines
k + geom_pointrange() ### lines with one point

## Maps
data <- data.frame(murder = USArrests$Murder, state = tolower(rownames(USArrests)))
map <- map_data("state")
l <- ggplot(data, aes(fill=murder))
l + geom_map(aes(map_id = state), map = map) +
  expand_limits(x = map$long, y = map$lat)

## Three Variables
seals$z <- with(seals, sqrt(delta_long^2 + delta_lat^2))
m <- ggplot(seals, aes(long, lat))
m + geom_contour(aes(z=z))
m + geom_raster(aes(fill=z), hjust=0.5, vjust=0.5, interpolate = F)
m + geom_tile(aes(fill=z))



# Stats 
