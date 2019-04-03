library(dplyr)

dataAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")


#get down to the records of interest
dataOfInterest <- subset(dataAll, substr(Date, 1, 8 ) %in% c("1/2/2007", "2/2/2007"))  # d/m/yyyy
rm(dataAll)  # remove unneeded records and free up memory

# prep the data for render
dataOfInterest <- mutate(dataOfInterest, dateTime = as.Date(dataOfInterest$Date), format="%d/%m/%Y")
time <- strptime(paste0(dataOfInterest$Date, ", ", dataOfInterest$Time), format="%d/%m/%Y, %H:%M:%S")


#plot2
plot(time, dataOfInterest$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Save to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()