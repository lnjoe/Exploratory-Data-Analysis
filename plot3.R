library(dplyr)

#read the data
dataAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")


#get down to the records of interest
dataOfInterest <- subset(dataAll, substr(Date, 1, 8 ) %in% c("1/2/2007", "2/2/2007"))  # d/m/yyyy
rm(dataAll)  # remove unneeded records and free up memory

# prep the data for render
dataOfInterest <- mutate(dataOfInterest, dateTime = as.Date(dataOfInterest$Date), format="%d/%m/%Y")
time <- strptime(paste0(dataOfInterest$Date, ", ", dataOfInterest$Time), format="%d/%m/%Y, %H:%M:%S")


#plot3
plot(time, dataOfInterest$Sub_metering_1, type = "n",  xlab = "", ylab = "Engery sub metering")
lines(time, dataOfInterest$Sub_metering_1   )
lines(time, dataOfInterest$Sub_metering_2,    col = "red")
lines(time, dataOfInterest$Sub_metering_3,    col = "blue")
legend("topright",  lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()