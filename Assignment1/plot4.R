# Load the Data
powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", na.strings= "?")

# Subsetting the data to 2007-02-01 and 2007-02-02 
powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007")) 

# Changing the Date format
powerconsumption$Date <- as.Date(powerconsumption$Date, format = "%d/%m/%Y")
powerconsumption$DateTime <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time))

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(powerconsumption$DateTime, powerconsumption$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
plot(powerconsumption$DateTime, powerconsumption$Voltage, type="l", xlab="datetime", ylab="Voltage")   
plot(powerconsumption$DateTime, powerconsumption$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_2, type="l", col="red")
lines(powerconsumption$DateTime, powerconsumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
plot(powerconsumption$DateTime, powerconsumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")