##################
## Student DLARLICK
## COURSERA : Exploratory Data Analysis
## Week 1 Assignment Project 1
## File : plot3.R
## Due 03/13/2016
##################

##Needed for mutate function
library(plyr)

##Set the working directory and read in the relevant datasets
setwd("c:/rprogramming/ExpDataAnalysis/Proj1")

##read delimited files
hpowercon <- read.delim("C://RProgramming//ExpDataAnalysis//Proj1/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?")
                        , colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

##Concatenate date and time for DateTime field
hpowercon <- mutate(hpowercon, DateTime= strptime(paste(hpowercon$Date,hpowercon$Time), format= "%d/%m/%Y %H:%M:%S"))

##Subset the dataset for the two days that we are interested
hpowercon <- subset(hpowercon, as.Date(Date, "%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(Date, "%d/%m/%Y") < as.Date('2007-02-03')) 

##Open a PNG device to direct the graph out too
png(filename="plot3.png")

##Create a plot and add two additional lines for the remaining sub metering columns
plot(hpowercon$DateTime,hpowercon$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpowercon$DateTime,hpowercon$Sub_metering_2, col="red")
lines(hpowercon$DateTime,hpowercon$Sub_metering_3, col="blue")

##Add a legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))

##Make a box around the plot
box()

##Close the device 
dev.off()


##End of Script





