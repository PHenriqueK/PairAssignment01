#####################
## R source to first pair assignment: first data set
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

# Dynamical Link to first R script file
source("Data_Assignment01.R")

# descriptive statistics of naked data
summary (AirlineSafety)
stat.desc(AirlineSafety, basic = FALSE)

# adjusting for seat km (creating a function to adjust seat km)
fun_adjkm <- function(x){ 
  (x / AirlineSafety$avail_seat_km_per_week)*1000000000
}

# creating subset of data, adjusting for seat km & merging with airline

AirlineSafety_adj <- AirlineSafety[, c(3:8)]
fun_adjkm(AirlineSafety_adj)
AirlineSafety_adj$airline <- AirlineSafety$airline

# descriptive statistics for adjusted data
summary (AirlineSafety_adj)
stat.desc(AirlineSafety_adj, basic = FALSE)

# histograms for adjusted data 
hist (AirlineSafety_adj$incidents_85_99,
      main="Incidents between 1985 and 1999", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Incidents")
hist (AirlineSafety_adj$incidents_00_14)
hist (AirlineSafety_adj$fatalities_85_99)
hist (AirlineSafety_adj$fatalities_00_14)
hist (AirlineSafety_adj$fat_accidents_85_99)
hist (AirlineSafety_adj$fat_accidents_00_14)

# running a paired t-test
t.test(AirlineSafety_adj$incidents_85_99, AirlineSafety_adj$incidents_00_14, paired = TRUE)
t.test(AirlineSafety_adj$fatalities_85_99, AirlineSafety_adj$fatalities_00_14, paired = TRUE)
t.test(AirlineSafety_adj$fat_accidents_85_99, AirlineSafety_adj$fat_accidents_00_14, paired = TRUE)

# correlation table of naked data
cor(AirlineSafety_adj[-1], method = "pearson")

# correlation table of adjusted data
AirlineSafety_adj <- t()
cor()
    
# Creating a Plot for fatalities by Airline
qplot (AirlineSafety_adj$fatalities_85_99, AirlineSafety_adj$fatalities_00_14, data = AirlineSafety_adj, label = AirlineSafety$airline,
       xlab = "1985 - 1999", ylab = "2000 - 2014",
       main = "Fatalities by Airline" ) +
  geom_smooth (method = "lm", se = FALSE) +
  geom_point() +
  geom_text (aes(label=ifelse (AirlineSafety_adj$fatalities_00_14>200 | AirlineSafety_adj$fatalities_85_99>400, 
                               as.character(AirlineSafety$airline), '')), hjust=1, vjust=1, size = 3)

# Creating a plot for fatal accidents by Airline
qplot (AirlineSafety_adj$fat_accidents_85_99, AirlineSafety_adj$fat_accidents_00_14, data = AirlineSafety_adj, label = AirlineSafety$airline,
       xlab = "1985 - 1999", ylab = "2000 - 2014",
       main = "Fatal Accidents by Airline" ) +
  geom_smooth (method = "lm", se = FALSE) +
  geom_point() +
  geom_text (aes(label=ifelse (AirlineSafety_adj$fat_accidents_00_14>200 || AirlineSafety_adj$fat_accidents_85_99>400, 
                               as.character(AirlineSafety$airline), '')), hjust=1, vjust=1, size = 3)

# Creating a plot for incidents by Airline
qplot (AirlineSafety_adj$incidents_85_99, AirlineSafety_adj$incidents_00_14, data = AirlineSafety_adj, label = AirlineSafety$airline,
       xlab = "1985 - 1999", ylab = "2000 - 2014",
       main = "Incidents by Airline" ) +
  geom_smooth (method = "lm", se = FALSE) +
  geom_point() +
  geom_text (aes(label=ifelse (AirlineSafety_adj$incidents_00_14>200 | AirlineSafety_adj$incidents_85_99>400, 
                               as.character(AirlineSafety$airline), '')), hjust=1, vjust=1, size = 3)

# Creating a safety score according to "Should Travelers Avoid Flying Airlines That Have 
# Had Crashes in the Past?" on fivethirtyeight

# adding the safety scores for each category of incidents 
# (safety score = overall mean of incident category in period y - number of incident of airline) 

fun_score <- function(x) { 
  ((mean (x) - x) * sqrt(AirlineSafety_adj)
}

AirlineSafety$incidents_85_99_score <- mean(AirlineSafety$incidents_85_99)-AirlineSafety$incidents_85_99
