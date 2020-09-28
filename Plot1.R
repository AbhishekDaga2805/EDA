setwd("C:\\Users\\abhishek.daga\\Desktop\\Coursera\\Week 1\\Assignment")

library(data.table)
#Reads in data from file
powerDT <- data.table::fread(input = "household_power_consumption.txt",na.strings = "?")

#Preventing histogram from printing in a scientific notation 
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]                        

#Changing date column to date datatype as requried
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Subsetting data in between the dats requried 
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Creating PNG of the histogram 
png("plot1.png", width=480, height=480)

#Plotting the requried histogram
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Closing the PNG
dev.off()



