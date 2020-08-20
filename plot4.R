##Exploratory Data Analysis - Week 1 Assignment
## Power consumption data graph plotting = plot 4

setwd("C:/Users/sally/Desktop/Coursera/4.Exploratory/W1 assign/")

powerdata<-read.table('./data/household_power_consumption.txt', sep=';',
                      header=TRUE, na.strings='?')

dataFeb <- subset(powerdata, Date %in% c('1/2/2007','2/2/2007'))

library(lubridate)

dataFeb$dateTime<- strptime(paste(dataFeb$Date, dataFeb$Time, sep=' '
),
'%d/%m/%Y %H:%M:%S') 


##Plot4
par(mfrow=c(2,2))
with(dataFeb, plot(dateTime, Global_active_power, xlab='',  
                   ylab='Global Active Power', type='n'))
with(dataFeb, lines(dateTime, Global_active_power, lwd=2))

with(dataFeb, plot(dateTime, Voltage, xlab='dateTime', ylab='Voltage', type='n'))
with(dataFeb, lines(dateTime, Voltage, lwd=1))

with(dataFeb, plot(dateTime, Sub_metering_1, xlab='', 
                   ylab='Energy sub metering', type='n'))
with(dataFeb,lines(dateTime, Sub_metering_1))
with(dataFeb,lines(dateTime, Sub_metering_2, col='red'))
with(dataFeb,lines(dateTime, Sub_metering_3, col='blue'))
legend('topright', lwd=1, col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 
                'Sub_metering_3'), bty='n')

with(dataFeb, plot(dateTime, Global_reactive_power, xlab='dateTime', 
                   ylab='Global_reactive_power', type='n'))
with(dataFeb, lines(dateTime, Global_reactive_power, lwd=1))

dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()
