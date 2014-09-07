setwd("C:\\Temp\\test")
tabAll <- read.csv("household_power_consumption.txt",head=TRUE,sep=';',nrows=2075259,comment.char="",stringsAsFactors=FALSE)


tabAll$Date<-as.Date(tabAll$Date,format="%d/%m/%Y")
data_tab$Sub_metering_1<-as.numeric(data_tab$Sub_metering_1)
data_tab$Sub_metering_2<-as.numeric(data_tab$Sub_metering_2)
data_tab$Sub_metering_3<-as.numeric(data_tab$Sub_metering_3)

data_tab<-tabAll[tabAll$Date>="2007-02-01"& tabAll$Date<="2007-02-02",]

date_time<-paste(data_tab$Date,data_tab$Time)
data_tab$Datetime <- as.POSIXct(date_time)

head(data_tab)
with(data_tab,plot(Sub_metering_1~Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab=""))
with(data_tab,lines(Sub_metering_2~Datetime,col='Red'))
with(data_tab,lines(Sub_metering_3~Datetime,col='Blue'))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off() 