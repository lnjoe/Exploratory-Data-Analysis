library(dplyr)


#read the data
dataAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")


#get down to the records of interest
dataOfInterest <- subset(dataAll, substr(Date, 1, 8 ) %in% c("1/2/2007", "2/2/2007"))  # d/m/yyyy
rm(dataAll)  # remove unneeded records and free up memory


#plot1
hist(dataOfInterest$Global_active_power, col = "red", main = "Glocal Active Power", xlab = "Global Active Power (kilowatts)")

# Save to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()