##################
## Student DLARLICK
## COURSERA : Exploratory Data Analysis
## Week 1 Assignment Project 1
## File : plot4.R
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
png(filename="plot4.png")

##Define the layout for the plots to be positioned within
par(mfrow=c(2,2))

##1st upper left quadrant
  ##Create a plot based on the assignment requirements
  plot(hpowercon$DateTime,hpowercon$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

  ##Make a box around the plot
  box()

##2nd upper right quadrant
  ##Create a plot based on the assignment requirements
  plot(hpowercon$DateTime,hpowercon$Voltage, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  ##Make a box around the plot
  box()
  
##3rd plot in the lower left
  ##Create a plot and add two additional lines for the remaining sub metering columns
  plot(hpowercon$DateTime,hpowercon$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(hpowercon$DateTime,hpowercon$Sub_metering_2, col="red")
  lines(hpowercon$DateTime,hpowercon$Sub_metering_3, col="blue")

  ##Add a legend
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), bty="n")

##4th plot in the lower right
  ##Create a plot for global reactive power
  plot(hpowercon$DateTime,hpowercon$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="")

  ##Make a box around the plot
  box()

##Close the device 
dev.off()

##End of Script





