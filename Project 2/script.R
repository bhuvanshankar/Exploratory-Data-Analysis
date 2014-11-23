setwd("~/Documents/git/ExploringData/Project 2")
library(ggplot2)

# Download the dataset 
download_data <- function() {
  file <- download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "dataset.zip")
  unzipped <-unzip("dataset.zip")
}

# Import the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Aggregates of emissions/year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png", width=480, height=480)
barplot(
  (aggTotals$Emissions)/10^4,
  names.arg=aggTotals$year,
  xlab="Year",
  ylab=expression(paste("PM2.5 Emissions (10"^"4"* " Tons)")),
  main="Total PM2.5 Emissions From All US Sources"
)

# 2. Baltimore Fips
baltimoreNEI <- NEI[NEI$fips=="24510",]
baltimoreagg <- aggregate(Emissions ~ year, baltimoreNEI,sum)
png("plot2.png", width=480, height=480)
barplot(
  baltimoreagg$Emissions,
  names.arg=baltimoreagg$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.off()
