#Plot 1 code. Week 1  of Exploratory Data Analysis on Coursera
# ..............................................................

# Read data
household <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subset just Feb 1 and Feb 2.
household_Feb12 <- household[household$Date == "1/2/2007" | household$Date == "2/2/2007", ]

#Alternative subset method
#household_Feb12 <- subset(household,  Date == "1/2/2007" | Date == "2/2/2007")

# Isolate just the Global Active Power column
Glo_act_pow <- as.numeric(as.character((household_Feb12$Global_active_power)))

# Create png file
png("plot1_Glo_act_pow.png", width = 480, height = 480)
hist(Glo_act_pow, col = "orange", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()