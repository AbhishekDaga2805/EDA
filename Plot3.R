setwd("C:\\Users\\abhishek.daga\\Desktop\\Coursera\\Week 1\\Assignment")

library(data.table)
#Reads in data from file
powerDT <- data.table::fread(input = "household_power_consumption.txt",na.strings = "?")

#Preventing histogram from printing in a scientific notation 
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Subsetting data in between the dats requried 
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]

#Creating PNG of the histogram 
png("plot3.png", width=480, height=480)

#Creating the Required Plot
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1,1), lwd=c(1,1,1))

#Closing the PNG
dev.off()



