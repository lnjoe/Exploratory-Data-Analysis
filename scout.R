library(dplyr)

#tmp <- read.csv("household_power_consumption.txt", header = TRUE)
#tmp <- read.csv("household_power_consumption.txt", sep=";", header = TRUE)
tmp <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")


#get down to the records of interest
slim <- subset(tmp, substr(Date, 1, 8 ) %in% c("1/2/2007", "2/2/2007"))  # d/m/yyyy
rm(tmp)  # remove unneeded records and free up memory
slim1 <- mutate(slim, dateTime = as.Date(strptime(paste0(slim$Date, ", ", slim$Time), format="%d/%m/%Y, %H:%M:%S")))
#slim1 <- mutate(slim, dateTime = as.Time(strptime(paste0(slim$Date, ", ", slim$Time), format="%d/%m/%Y, %H:%M:%S")))
time <- strptime(paste0(slim$Date, ", ", slim$Time), format="%d/%m/%Y, %H:%M:%S")


#plot1
hist(slim$Global_active_power, col = "red", main = "Glocal Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off

#plot2
#time <- strptime(paste0(slim$Date, ", ", slim$Time), format="%d/%m/%Y, %H:%M:%S")
#plot(time, slim$Global_active_power, type = "l")

#plot3
#

#plot4
#plot(time, slim$Global_active_power, type = "l")
#plot(time, slim$Voltage, type = "l")
#
# plot(time, slim$Global_reactive_power, type = "l")
