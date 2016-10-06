#First Pair Assignment for Introduction to Collaborative Social Science Data Analysis (MPP-E1180)

Dan Murphy & Paulo Kalkhake

Latest Update: October 7, 2016

This repository contains the material for the First Pair Assignment in Introduction to Collaborative Social Science Data Analysis (MPP-E1180) @HSoG Berlin

##Investigated Data Sets

| Topic                    | Link |
| ----------------------- | --------------------- | 
| Airline Safety Record     | [Should Travelers Avoid Flying Airlines That Have Had Crashes In The Past?](http://fivethirtyeight.com/features/should-travelers-avoid-flying-airlines-that-have-had-crashes-in-the-past/)                   | 
| Global Alcohol Consumption       | [Where Do People Drink The Most Beer, Wine, And Spirits?](http://fivethirtyeight.com/datalab/dear-mona-followup-where-do-people-drink-the-most-beer-wine-and-spirits/)        |

The first data set is from fivethirtyeight and based on the Aviation Safety Network’s database. It breaks down the number of incidents, fatal accidents, and fatalities in 56 airlines. These incidents, accidents, and fatalities are separated into two groups, those that occured in between 1985 to 1999 and those that occured between 2000 and 2014. The data set also includes the available seat kilometers per week for each airline, which fivethirtyeight defines as the number of seats multiplie by the number of kilometres the airline flies. 

The second data set also comes from fivethirtyeight, and deals with global alcohol consumption trends. Specifically, it provides the World Health Organization's (WHO) data for the total litres of alcohol consumed per person in 193 countries around the world in 2010. It also includes adjusted data showing the number of servings of beer, wine, and spirits consumed by each person in 2010. 

We performed basic transformations on the data, and illustrated the datas' distributions using a variety relevant of descriptive statistics. 

##Guide for R source code

The files are dynamically linked. Both descripitive statistics files automatically load the necessary data and packages.

| R source code | What it does |
|---------------|--------------|
| [Data_Assignment01.R]("Data_Assignment01.R") | Loads necessary data and packages |
| [Desc_DataSet1_Ass01.R]("Desc_DataSet1_Ass01.R") | Analytical investigation of airline safety records |
| [Desc_DataSet2_Ass01.R]("Desc_DataSet2_Ass01.R") | Analytical investigation of global drinking trends |