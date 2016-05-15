#Plot 2 code. Week 1  of Exploratory Data Analysis on Coursera
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
png("plot2.png", width = 480, height = 480)
plot(household_Feb12$Datetimecombined, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()