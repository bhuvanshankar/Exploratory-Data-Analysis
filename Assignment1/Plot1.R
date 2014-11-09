# Load the Data
powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", na.strings= "?")

# Subsetting the data to 2007-02-01 and 2007-02-02 
powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007")) 

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(powerconsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
