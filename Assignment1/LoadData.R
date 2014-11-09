# Load the Data
powerconsumption <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", na.strings= "?")

# Subsetting the data to 2007-02-01 and 2007-02-02 
powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date == "2/2/2007")) 
