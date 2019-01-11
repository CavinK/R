## Cost minimisation

install.packages("lpSolve")
library(lpSolve)

costs <- matrix(10000,8,5); costs[4,1] <- costs[-4,5] <-0
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7; costs[1,3] <- costs[2,4] <-7.7
costs[5,1] <- costs[7,3] <- 8; costs[1,4] <- 8.4; costs[6,2] <- 9
costs[8,4] <- 10; costs[4,2:4] <- c(.7,1.4,2.1)
costs

row.signs <- rep ("<",8)
row.rhs <- c(200,300,350,200,100,50,100,150)
col.signs <- rep (">",5)
col.rhs <- c(250,100,400,500,200)

lp.transport(costs,"min",row.signs,row.rhs,col.signs,col.rhs)
lp.transport(costs,"min",row.signs,row.rhs,col.signs,col.rhs)$solution



## Traveling salesman problem

install.packages("TSP")
library(TSP)
data("USCA50")
USCA50

methods <- c("nearest_insertion", "farthest_insertion", "arbitrary_insertion", "nn", "repetitive_nn", "2-opt")
tours <- sapply(methods, FUN = function(m) solve_TSP(USCA50,method=m),simplify=FALSE)

tours[[1]]

dotchart(c(sapply(tours,FUN = attr,"tour_length"),optimal=14497),xlab="tour length",xlim=c(0,20000))



data("USCA50")
tsp <- insert_dummy(USCA50,label="cut")
tsp

tour <- solve_TSP(tsp,method = "farthest_insertion")
tour

path <- cut_tour(tour,"cut")
head(labels(path))
tail(labels(path))

install.packages("maps")
library("maps")
library("sp")
library("maptools")
data("USCA312_map")

plot_path <- function(path) {
  plot(as(USCA312_coords,"Spatial"),axes=TRUE)
  plot(USCA312_basemap,add=TRUE,col="gray")
  points(USCA312_coords,pch=3,cex=0.4,col="red")
  path_line <- SpatialLines(list(Lines(list(Line(USCA312_coords[path,])),ID="1")))
  plot(path_line,add=TRUE,col="black") + points(USCA312_coords[c(head(path,1),tail(path,1)),],pch=19,col="black")
}
plot_path(path)
