# Question 1
csvfile <- read.csv("getdata-data-ss06hid.csv")
million <- subset(csvfile, csvfile$VAL == 24)

#Question 3
require(XLConnect)
library("XLConnect")
dat <- readWorksheetFromFile("getdata-data-DATA.gov_NGAP.xlsx", sheet = 1, region = "G18:O23", header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) 

#Question 4
require(XML)
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
zipcode <- xpathSApply(rootNode,"//zipcode", xmlValue)
length(zipcode[zipcode==21231])

#Question 5
library(data.table)
DT <- fread(input="getdata-data-ss06pid.csv", sep=",")
system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(tapply(DT$pwgtp15,DT$SEX,mean))

system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))