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
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate of Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

baltimoreplot <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(baltimoreplot)


dev.off()