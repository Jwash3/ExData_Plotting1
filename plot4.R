#Plot 4 code. Week 1  of Exploratory Data Analysis on Coursera
# ..............................................................

# Read data
household <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

# Subset just Feb 1 and Feb 2.
household_Feb12 <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007", ]

#Alternative subset method
#household_Feb12 <- subset(household,  Date == "1/2/2007" | Date == "2/2/2007")

# Create a combined datetime column
household_Feb12$Datetimecombined <- strptime(paste(household_Feb12$Date, household_Feb12$Time, sep = " "),
                                             format = "%d/%m/%Y %H:%M:%S")

# Convert the Date column to time
#household_Feb12$Date <- strptime(household_Feb12$Date, format = "%d/%m/%Y")

# Create png file
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(household_Feb12$Datetimecombined, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
plot(household_Feb12$Datetimecombined, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(household_Feb12$Datetimecombined, data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(household_Feb12$Datetimecombined, data$Sub_metering_2, type = "l", col = "red", xlab = "")
lines(household_Feb12$Datetimecombined, data$Sub_metering_3, type = "l", col = "blue", xlab = "")
legend("topright", col = c("black", "red", "blue"), c("Sub metering 1", "Sub metering 2", 
                                                      "Sub metering 3"), lty=1)
plot(household_Feb12$Datetimecombined, data$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()