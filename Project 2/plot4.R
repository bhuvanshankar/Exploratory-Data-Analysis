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

# Coal sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# 4
png(filename='plot4.png', width=480, height=480)

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()