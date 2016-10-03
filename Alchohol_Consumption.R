#####################
## R Source to First Pair Assignment: Second Data Set
## Dan Murphy & Paulo Kalkhake
## 1 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair" 
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
####################

#Renames the "total_litres_of_pure_alcohol" column to "Total_Alc"
Total_Alc <- Alchohol_Raw$total_litres_of_pure_alcohol

#Descriptive Statistics 
summary(Alchohol_Raw$beer_servings)
summary(Alchohol_Raw$spirit_servings)
summary(Alchohol_Raw$wine_servings)
summary(Total_Alc)

stat.desc(Alchohol_Raw, basic = FALSE)

#Histograms
hist(Alchohol_Raw$beer_servings)
hist(Alchohol_Raw$spirit_servings)
hist(Alchohol_Raw$wine_servings)
hist(Total_Alc)

#Correlation Table
cor(Alchohol_Raw[-1], method = "pearson")

#Plot beer consumption & total litres of pure alcohol consumed
plot(Alchohol_Raw$beer_servings, Total_Alc)
abline(lm(Total_Alc~Alchohol_Raw$beer_servings))
text(Alchohol_Raw$beer_servings, Total_Alc, labels = Alchohol_Raw$country,
     cex = .5, pos = 4, col = "red")

#Group bar plot of top four consumers
Top4 <- subset.data.frame(Alchohol_Raw, Total_Alc >= 11.9)
Top4Matrix <- t(Top4[-1])
ServingsMatrix <- Top4Matrix[1:3, 1:4]
colnames(ServingsMatrix) <- Top4$country
barplot(ServingsMatrix, main = "Top Four Alcohol Consumers",
        ylab = "Servings", xlab ="Country", 
        legend = c("Beer", "Spirits", "Wine"), 
        args.legend = list(x = "topright", cex = .7), beside = TRUE)

#Bar plots for top consumers of each type



