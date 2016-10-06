#####################
## R source to first pair assignment: second data set
## Dan Murphy & Paulo Kalkhake
## Latest Update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: run descriptive statistics & data analysis
####################

# Set working directory
try(setwd("/Users/Paulo/GitHub/PairAssignment01"),silent=TRUE)
try(setwd("/Users/djm113/Documents/GitHub/PairAssignment01"),silent=TRUE)
getwd()

#Loading data
source("Data_Assignment01.R")


#Renames the "total_litres_of_pure_alcohol" column to "Total_Alc"
Total_Alc <- Alcohol_Raw$total_litres_of_pure_alcohol


#Descriptive Statistics 
summary(Alcohol_Raw$beer_servings)

summary(Alcohol_Raw$spirit_servings)

summary(Alcohol_Raw$wine_servings)

summary(Total_Alc)

describe(Alcohol_Raw)
stat.desc(Alcohol_Raw, basic = FALSE)


#Histograms
hist(Alcohol_Raw$beer_servings, 
     main = "Beer Servings Histogram", 
     xlim = c(0, 400),
     xlab = "Beer Servings",
     breaks = 20,
     col = "Blue")

hist(Alcohol_Raw$spirit_servings, 
     main = "Spirit Servings Histogram", 
     xlab = "Spirit Servings",
     xlim = c(0, 400),
     breaks = 20,
     col = "Blue")

hist(Alcohol_Raw$wine_servings, 
     main = "Wine Servings Histogram", 
     xlab = "Wine Servings",
     xlim = c(0, 400),
     breaks = 20,
     col = "Blue")

hist(Total_Alc, 
     main = "Alcohol Consumption Histogram", 
     xlab = "Litres of Alcohol Consumed",
     ylim = c(0,50),
     breaks = 20,
     col = "Blue")


#Correlation Table
cor(Alcohol_Raw[-1], method = "pearson")


#Plot for total litres of pure alcohol consumed & beer consumption
qplot(Alcohol_Raw$total_litres_of_pure_alcohol, Alcohol_Raw$beer_servings,
      data = Alcohol_Raw, label = Alcohol_Raw$country,
      xlab = "Litres of Pure Alcohol", 
      ylab = "Beer Servings",
      main = "Beer Consumption") + 
  geom_smooth (method = "lm", se = FALSE)


#Plot for total litres of pure alcohol consumed & wine consumption
qplot(Alcohol_Raw$total_litres_of_pure_alcohol, Alcohol_Raw$wine_servings,
      data = Alcohol_Raw, label = Alcohol_Raw$country,
      xlab = "Litres of Pure Alcohol", 
      ylab = "Wine Servings",
      main = "Wine Consumption") + 
  geom_smooth (method = "lm", se = FALSE)


#Plot for total litres of pure alcohol consumed & spirit consumption
qplot(Alcohol_Raw$total_litres_of_pure_alcohol, Alcohol_Raw$spirit_servings,
      data = Alcohol_Raw, label = Alcohol_Raw$country,
      xlab = "Litres of Pure Alcohol", 
      ylab = "Spirit Servings",
      main = "Spirit Consumption") + 
  geom_smooth (method = "lm", se = FALSE)

#Group bar plot of top four consumers
Top4 <- subset.data.frame(Alcohol_Raw, Total_Alc >= 11.9)
Top4Matrix <- t(Top4[-1])
ServingsMatrix <- Top4Matrix[1:3, 1:4]
colnames(ServingsMatrix) <- Top4$country
barplot(ServingsMatrix, main = "Top Four Alcohol Consumers",
        ylab = "Servings", 
        xlab ="Country",
        ylim = c(0, 500),
        legend = c("Beer", "Spirits", "Wine"),
        args.legend = list(x = "topright", cex = .7), beside = TRUE)





