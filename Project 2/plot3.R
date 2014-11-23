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
 
#  Create Data 
baltimoreNEI <- subset(NEI, fips == "24510") 
baltimoreAgg <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
baltimoreplot <- ggplot(baltimoreAgg, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")

print(baltimoreplot)

dev.off()