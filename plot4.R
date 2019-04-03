library(dplyr)

dataAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")


#get down to the records of interest
dataOfInterest <- subset(dataAll, substr(Date, 1, 8 ) %in% c("1/2/2007", "2/2/2007"))  # d/m/yyyy
rm(dataAll)  # remove unneeded records and free up memory

# prep the data for render
dataOfInterest <- mutate(dataOfInterest, dateTime = as.Date(dataOfInterest$Date), format="%d/%m/%Y")
time <- strptime(paste0(dataOfInterest$Date, ", ", dataOfInterest$Time), format="%d/%m/%Y, %H:%M:%S")


#plot4
par(mfrow=c(2,2))
plot(time, dataOfInterest$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(time, dataOfInterest$Voltage, type = "l",  xlab = "datetime", ylab = "Voltage")

plot(time, dataOfInterest$Sub_metering_1, type = "n",  xlab = "", ylab = "Engery sub metering")
lines(time, dataOfInterest$Sub_metering_1   )
lines(time, dataOfInterest$Sub_metering_2,    col = "red")
lines(time, dataOfInterest$Sub_metering_3,    col = "blue")
legend("topright",  lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(time, dataOfInterest$Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power")

# Save to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()