# Classification
#---------------------
read.csv("C://data/car_purchase.csv") -> car_purchase
# Removing fist column
library(dplyr)
car_purchase %>% select(-1) -> car_purchase

# Splitting Data
sample.split(car_purchase$Purchased, SplitRatio = .65) -> split_values
subset(car_purchase, split_values==T) -> train_set
subset(car_purchase, split_values==F) -> test_set

# Loading RPART
install.packages("rpart")
library(rpart) 

# Building Classification Model
rpart(Purchased~. data = train_set) -> mod_class
predict(mod_class, test_set, type = "class") -> result_class
table(test_set$Purchased, result_class)



#-----------------------------------------
# Regression(understanding what influences a pokemon's attack)
library(ggplot2)
View(diamonds)
str(diamonds)

# Splitting Data
install.packages("caTools")
library(caTools)

sample.split(diamonds$price, SplitRatio = .65) -> split_values
?sample.split

subset(diamonds, split_values==T) -> train_reg
subset(diamonds, split_values==F) -> test_reg
View(train_reg)
View(test_reg)

#Building lm model
lm(price~., data = train_reg) -> mod_regress ### independent variable 
predict(mod_regress, test_reg) -> result_regress
cbind(Actual = test_reg$price, Predicted = result_regress) -> Final_Data
as.data.frame(Final_Data) -> Final_Data ### Actual price of diamond vs predicted price 
View(Final_Data)

# Finding Error
(Final_Data$Actual - Final_Data$Predicted) -> error
cbind(Final_Data, error) -> Final_Data
rmse <- sqrt(mean(Final_Data$error^2))
rmse ### Aggregate Error of Prediction 



#-----------------------------------------
# Clustering 
View(iris)
iris[1:4] -> iris_k
as.matrix(iris_k) -> iris_k
kmeans(iris_k, 3) -> iris_cluster ### Divide all 150 data into 3 clusters
cbind(iris, iris_cluster$cluster) -> clustered_Data
View(clustered_Data) ### can check which cluster the data belong to 





# Pokemon Case Study(Reinforcement Learning)
#----------------------------------------- 
# Loading Data-set
read.csv("C://data/pokemon.csv") -> pokemon
View(pokemon)

# Removing first column
library(dplyr)
pokemon %>% select(-1) -> pokemon

# Renaming columns
colnames(pokemon)[2] <- "Primary_Type"
colnames(pokemon)[3] <- "Secondary_Type"
colnames(pokemon)[5] <- "Health_Points"
colnames(pokemon)[8] <- "Special_Attack"
colnames(pokemon)[9] <- "Special_Defence"

# Understanding Data
str(pokemon)

as.factor(pokemon$isLegendary) -> pokemon$isLegendary
as.factor(pokemon$hasMegaEvolution) -> pokemon$hasMegaEvolution
as.factor(pokemon$hasGender) -> pokemon$hasGender

# Different Primary Types
table(pokemon$Primary_Type)

# Selecting Glass Pokemon
library(dplyr)
pokemon %>% filter(Primary_Type == "Grass") -> Grass_pokemon
Grass_pokemon %>% filter(Secondary_Type == "Poison") -> Grass_Poison_pokemon
range(Grass_Poison_pokemon$Speed) ### Check max and min of speed 
Grass_Poison_pokemon %>% filter(Speed==90) -> My_Grass_Pokemon ### Select Grass Pokemon with max speed 

# Selecting Water Pokemon
pokemon %>% filter(Primary_Type == "Water") -> water_pokemon
Water_pokemon %>% filter(Secondary_Type == "Psychic") -> Water_Psychic_Pokemon
range(Water_Psychic_Pokemon$Defence)
Water_Psychic_Pokemon %>% filter(Defence==110) -> My_Water_Pokemon

# Selecting Fire Pokemon
pokemon %>% filter(Primary_Type == "Fire") -> Fire_pokemon
Fire_pokemon %>% filter(Secondary_Type=="Fighting") -> Fire_Fighting_Pokemon
range(Fire_Fighting_Pokemon$Attack)
Fire_Fighting_Pokemon %>% filter(Attack==123) -> My_Fire_Pokemon 

# My three pokemons 
rbind(My_Fire_Pokemon, My_Grass_Pokemon, My_Water_Pokemon) -> My_Pokemons



#--------------------------------------------------------

# Regression(Understanding what influences a pokemon's attack)

# Splitting Data
sample.split(pokemon$Attack, SplitRatio = .65) -> split_index
subset(pokemon, split_index == T) -> train1
subset(pokemon, split_index == F) -> test1
??split_index

# Building Model 1(Attack vs Defense)
lm(Attack~Defence, data=train1) -> mod_regress
predict(mod_regress, test1) -> result_regress
cbind(Actual=test1$Attack, Predicted=result_regress) -> Final_Data
as.data.frame(Final_Data) -> Final_Data

# Finding Error
(Final_Data$Actual - Final_Data$Predicted) -> error
cbind(Final_Data, error) -> Final_Data
rmse1 <- sqrt(mean(Final_Data$error^2))
rmse1

# Building Model 2(Attack w.r.t. Defence, Speed, and Health Points)
lm(Attack ~ Defence+Speed+Health_Points, data=train1) -> mod_regress2
predict(mod_regress2, test1) -> result_regress2
cbind(Actual=test1$Attack, Predicted=result_regress2) -> Final_Data2
as.data.frame(Final_Data2) -> Final_Data2

# Finding Error
(Final_Data2$Actual - Final_Data2$Predicted) -> error2
cbind(Final_Data2, error) -> Final_Data2
rmse2 <- sqrt(mean(Final_Data2$error^2))
rmse2



#--------------------------------------------

# Classification(Is the Pokemon Legendary or not)

# Splitting Data
library(caTools)
sample.split(pokemon$isLegendary, SplitRatio = .65) -> split_values
subset(pokemon, split_values == T) -> train_data
subset(pokemon, split_values == F) -> test_data

nrow(train_data)
nrow(test_data)



#-----------------------------------------------

# Decision Tree
library(rpart)

# Building Model1
rpart(isLegendary~., data=train_data) -> mod1
predict(mod1, test_data, type="class") -> result1
table(test_data$isLegendary, result1)

# Evaluating Model1
library(caret)
condusionMatrix(table(test_data$isLegendary, result1))

# Building Model2
rpart(isLegendary ~ Attack+Defense+Speed, data = train_data) -> mod2
predict(mod2, test_data, type = "class") -> result2
table(test_Data$isLegendary, result2)

# Evaluating Model2
library(caret)
condusionMatrix(table(test_data$isLegendary, result2))
