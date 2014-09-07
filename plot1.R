setwd("C:\\Temp\\test")
tabAll <- read.csv("household_power_consumption.txt",head=TRUE,sep=';',nrows=2075259,comment.char="",stringsAsFactors=FALSE)
class(tabAll$Date)

tabAll$Date<-as.Date(tabAll$Date,format="%d/%m/%Y")
data_tab$Global_active_power<-as.numeric(data_tab$Global_active_power)
data_tab<-tabAll[tabAll$Date>="2007-02-01"& tabAll$Date<="2007-02-02",]

date_time<-paste(data_tab$Date,data_tab$Time)
data_tab$Datetime <- as.POSIXct(date_time)


png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_tab$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
