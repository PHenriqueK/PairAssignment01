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

# Load Packages: credits to Wickham Hadley, Xie Yihui, Frank Harrell Jr, Philippe Grosejan & Frederic Ibanez
# (install when needed)
library(ggplot2)
library(knitr)
library(pastecs)
library(Hmisc)

# Set working directory
try(setwd("/Users/Paulo/GitHub/PairAssignment01"),silent=TRUE)
try(setwd("/Users/djm113/Documents/GitHub/PairAssignment01"),silent=TRUE)
getwd()

# Load Dataset 1 from fivethirthyeight: airline safety 
AirlineSafety <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", sep = ",", header=TRUE, stringsAsFactors=FALSE)
names(AirlineSafety)
AirlineSafety[, c(3:8)] <- sapply(AirlineSafety[, c(3:8)], as.numeric) ##trying out, how to transform parts of the data frame

# Load Dataset 2 from fivethirtyeight: worldwide alcohol consumption 
Alcohol_Raw <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/alcohol-consumption/drinks.csv")
names(Alcohol_Raw)