##################
## Student DLARLICK
## COURSERA : Exploratory Data Analysis
## Week 1 Assignment Project 1
## File : plot1.R
## Due 03/13/2016
##################

##Needed for mutate function
library(plyr)

##Set the working directory and read in the relevant datasets
setwd("c:/rprogramming/ExpDataAnalysis/Proj1")

##read delimited files
hpowercon <- read.delim("C://RProgramming//ExpDataAnalysis//Proj1/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?")
   , colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##convert the column to a proper date format
hpowercon <- mutate(hpowercon,Date=as.Date(hpowercon$Date,format= "%d/%m/%Y") ) 

##Subset the dataset for the two days that we are interested
hpowercon <- subset(hpowercon, as.Date(Date, "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(Date, "%d/%m/%Y") < as.Date('2007-02-03')) 

  ##Open a PNG device to direct the graph out too
  png(filename="plot1.png")
  
  ##Create a historgram based on the assignment requirements
  hist(hpowercon$Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)" )

  ##Close the device 
  dev.off()
  

##End of Script





