##Exploratory Data Analysis - Week 1 Assignment
## Power consumption data graph plotting - Plot 2

setwd("C:/Users/sally/Desktop/Coursera/4.Exploratory/W1 assign/")

powerdata<-read.table('./data/household_power_consumption.txt', sep=';',
                      header=TRUE, na.strings='?')

dataFeb <- subset(powerdata, Date %in% c('1/2/2007','2/2/2007'))

library(lubridate)

dataFeb$dateTime<- strptime(paste(dataFeb$Date, dataFeb$Time, sep=' '
),
'%d/%m/%Y %H:%M:%S') 


##Plot2
with(dataFeb, plot(dateTime, Global_active_power, xlab='', 
                   ylab='Global Active Power (kilowatts)', type='n'))
with(dataFeb, lines(dateTime, Global_active_power, lwd=2))
dev.copy(png, file='plot2.png', width=480, height=480)
dev.off()
