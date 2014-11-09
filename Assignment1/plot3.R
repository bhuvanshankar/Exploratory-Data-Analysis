# Load the Data
powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", na.strings= "?")

# Subsetting the data to 2007-02-01 and 2007-02-02 
powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007")) 

# Changing the Date format
powerconsumption$Date <- as.Date(powerconsumption$Date, format = "%d/%m/%Y")
powerconsumption$DateTime <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time))

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(powerconsumption$DateTime, powerconsumption$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_2, type="l", col="red")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
