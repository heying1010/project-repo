setwd("C:\\Temp\\test")
tabAll <- read.csv("household_power_consumption.txt",head=TRUE,sep=';',nrows=2075259,comment.char="",stringsAsFactors=FALSE)


tabAll$Date<-as.Date(tabAll$Date,format="%d/%m/%Y")
data_tab<-tabAll[tabAll$Date>="2007-02-01"& tabAll$Date<="2007-02-02",]
data_tab$Global_active_power<-as.numeric(data_tab$Global_active_power)
data_tab$Sub_metering_1<-as.numeric(data_tab$Sub_metering_1)
data_tab$Sub_metering_2<-as.numeric(data_tab$Sub_metering_2)
data_tab$Sub_metering_3<-as.numeric(data_tab$Sub_metering_3)
data_tab$Voltage<-as.numeric(data_tab$Voltage)
data_tab$Global_reactive_power<-as.numeric(data_tab$Global_reactive_power)


date_time<-paste(data_tab$Date,data_tab$Time)
data_tab$Datetime <- as.POSIXct(date_time)


par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(data_tab,{
     plot(Global_active_power~Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
     plot(Voltage~Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
     plot(Sub_metering_1~Datetime,ylab="Global Active Power (kilowatts)", xlab="")         
          lines(Sub_metering_2~Datetime,col='Red')
          lines(Sub_metering_3~Datetime,col='Blue')
          legend("topright",col=c("black","red","blue"),lty=1,bty="o",pch=NA,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
     })

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()