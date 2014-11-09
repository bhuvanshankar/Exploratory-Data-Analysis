# Load the Data
powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", na.strings= "?")

# Subsetting the data to 2007-02-01 and 2007-02-02 
powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007")) 

# Changing the Date format
powerconsumption$Date <- as.Date(powerconsumption$Date, format = "%d/%m/%Y")
powerconsumption$DateTime <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time))

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(powerconsumption$DateTime, powerconsumption$Global_active_power, type = "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
