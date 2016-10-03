#####################
## R source to first pair assignment
## Dan Murphy & Paulo Kalkhake
## Last update: 3 October 2016
## R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## What it does: set working directory & load packages & load datasets
##########################

# remove objects from the specified environment
rm(list=ls())  

# Load Packages: credits to Wickham Hadley, Xie Yihui, Philippe Grosejan & Frederic Ibanez
library(ggplot2)
library(knitr)
library(pastecs)

# Set working directory
try(setwd("/Users/Paulo/GitHub/PairAssignment01"),silent=TRUE)
try(setwd(""),silent=TRUE) ##working directory is misssing!
getwd()

# Load Dataset 1 from fivethirthyeight: airline safety 
AirlineSafety <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv")
names(AirlineSafety)

# Load Dataset 2 from fivethirtyeight: worldwide alcohol consumption 
Alcohol_Raw <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/alcohol-consumption/drinks.csv")
names(Alcohol_Raw)