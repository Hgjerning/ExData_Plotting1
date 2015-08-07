# Prepare R for data
#getwd()
#[1] "C:/Users/dell2013/Documents"
setwd("~/G-ART/artData/Coursera/ExploratoryDataAnalysis/Data")
library(data.table)
library(lubridate)

#> getwd()
#[1] "C:/Users/dell2013/Documents/G-ART/artData/Coursera/ExploratoryDataAnalysis/Data"

# check for files & directories:
#if(!file.exists("./Data")){dir.create("./Data")}
if (!file.exists("household_power_consumption.txt")) {
    fileurl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, destfile="power_data.zip")
    unzip(zipfile = "power_data.zip")
}



variable.class <- c(rep('character',2),rep('numeric',7))
power.consumption <- read.table("household_power_consumption.txt",
                                header=TRUE, sep=";",na.strings="?",colClasses=variable.class)
power.consumption <- power.consumption[power.consumption$Date=="1/2/2007" 
                                       | power.consumption$Date=="2/2/2007",]

# clean up the variable names and convert date/time fields
cols<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
        "Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(power.consumption) <- cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]

# write a clean data set to the directory
if (!file.exists("power_consumption.txt")) {
write.table(power.consumption, file="power_consumption.txt", sep="|", row.names=FALSE)
} else {
  power.consumption <- read.table("power_consumption.txt", header=TRUE, sep="|")
  power.consumption$DateTime <- as.POSIXlt(power.consumption$DateTime)
}

