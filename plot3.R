##Exploratory Data Analysis - Week 1 Assignment
## Power consumption data graph plotting - Plot 3

setwd("C:/Users/sally/Desktop/Coursera/4.Exploratory/W1 assign/")

powerdata<-read.table('./data/household_power_consumption.txt', sep=';',
                      header=TRUE, na.strings='?')

dataFeb <- subset(powerdata, Date %in% c('1/2/2007','2/2/2007'))

library(lubridate)

dataFeb$dateTime<- strptime(paste(dataFeb$Date, dataFeb$Time, sep=' '
),
'%d/%m/%Y %H:%M:%S') 

##PLot3
with(dataFeb, plot(dateTime, Sub_metering_1, xlab=' ', 
                   ylab='Energy sub metering', type='n'))
with(dataFeb,lines(dateTime, Sub_metering_1))
with(dataFeb,lines(dateTime, Sub_metering_2, col='red'))
with(dataFeb,lines(dateTime, Sub_metering_3, col='blue'))
legend('topright', lwd=1, col=c('black', 'red', 'blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 
                'Sub_metering_3'))

dev.copy(png, file='plot3.png', width=480, height=480)
dev.off()
