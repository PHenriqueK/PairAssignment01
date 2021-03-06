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

# Dynamical Link to Data/Packages R script file
source("Data_Assignment01.R")

# descriptive statistics of naked data using
summary(AirlineSafety)
stat.desc(AirlineSafety, basic = FALSE)
describe(AirlineSafety)

# adjusting for seat km (creating a function to adjust seat km)
func_adjkm <- function(x){ 
  (x / AirlineSafety$avail_seat_km_per_week)*1000000000
}

# creating a new data frame & adjusting for seat km using the function, created earlier 
AirlineSafety_adj <- AirlineSafety
AirlineSafety_adj[, c(3:8)] <- sapply(AirlineSafety_adj[, c(3:8)], func_adjkm)

# descriptive statistics for adjusted data
summary(AirlineSafety_adj)
stat.desc(AirlineSafety_adj, basic = FALSE)
describe(AirlineSafety_adj)

# histograms for adjusted data 
hist(AirlineSafety_adj$incidents_85_99,
      main="Incidents between 1985 and 1999 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Incidents")

hist(AirlineSafety_adj$incidents_00_14,
      main="Incidents between 2000 and 2014 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Incidents")

hist(AirlineSafety_adj$fatalities_85_99,
      main="Incidents between 1985 and 1999 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Fatalities")

hist(AirlineSafety_adj$fatalities_00_14,
      main="Incidents between 2000 and 2014 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Fatalities")

hist(AirlineSafety_adj$fat_accidents_85_99,
      main="Incidents between 1985 and 1999 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Fatal Incidents")

hist(AirlineSafety_adj$fat_accidents_00_14,
      main="Incidents between 2000 and 2014 (adjusted for billion seat km)", 
      col="blue", 
      breaks = 20,
      xlab = "Incidents",
      ylab = "Number of Fatal Incidents")

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
g1 <- qplot(AirlineSafety_adj$fatalities_85_99, AirlineSafety_adj$fatalities_00_14, data = AirlineSafety_adj, 
      label = AirlineSafety_adj$airline,
      xlab = "1985 - 1999", 
      ylab = "2000 - 2014",
      main = "Fatalities by Airline (adjusted for billion seat km)" ) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  geom_text(aes(label=ifelse(AirlineSafety_adj$fatalities_00_14>200 | AirlineSafety_adj$fatalities_85_99>450, 
                              as.character(AirlineSafety$airline), '')), hjust=-.1, vjust=.1, size = 3)

g1 + expand_limits(x=900, y=1050) ##expand axis limits for better graphical result

# Creating a plot for fatal accidents by Airline
g2 <- qplot(AirlineSafety_adj$fatal_accidents_85_99, AirlineSafety_adj$fatal_accidents_00_14, data = AirlineSafety_adj, 
      label = AirlineSafety_adj$airline,
      xlab = "1985 - 1999", 
      ylab = "2000 - 2014",
      main = "Fatal Accidents by Airline (adjusted for billion seat km)" ) +
  geom_smooth(method = "lm", se = FALSE) +
  expand_limits(colour = factor(seq(2, 10, by = 2))) +
    geom_point () +
  geom_text(aes(label=ifelse(AirlineSafety_adj$fatal_accidents_00_14>2 | AirlineSafety_adj$fatal_accidents_85_99>10, 
                              as.character(AirlineSafety$airline), '')), hjust= -.1, size = 3)
g2 + expand_limits(x=13, y=8) ##expand axis limits for better graphical result

# Creating a plot for incidents by Airline
g3 <-qplot(AirlineSafety_adj$incidents_85_99, AirlineSafety_adj$incidents_00_14, data = AirlineSafety_adj, 
      label = AirlineSafety_adj$airline,
      xlab = "1985 - 1999", 
      ylab = "2000 - 2014",
      main = "Incidents by Airline (adjusted for billion seat km)" ) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  geom_text(aes(label=ifelse (AirlineSafety_adj$incidents_00_14>15 | AirlineSafety_adj$incidents_85_99>20, 
                               as.character(AirlineSafety$airline), '')), vjust=1.5, size = 3)

g3 + expand_limits(x=68, y=31) ##expand axis limits for better graphical result
