df.power <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                     na.strings="?")
df.power$Date <- as.Date(df.power$Date,"%d/%m/%Y")
startD <- as.Date("02/01/2007","%d/%m/%Y")
endD <- as.Date("02/02/2007","%d/%m/%Y")

df.power <- df.power[(df.power$Date == "2/1/2007") | (df.power$Date == "2/2/2007"),]
df.power$DateTime <- strptime(paste(format(df.power$Date,"%d/%m/%Y %H:%M:%S"),df.power$Time),format="%d/%m/%Y %H:%M:%S")

  png(filename="plot4.png",width=480,height=480)
  par (mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))


  plot(df.power$DateTime,df.power$Global_active_power,xlab="",ylab="Global Active Power",types="l")
  plot(df.power$DateTime,df.power$Global_active_power,xlab="datetime",ylab="Voltage",type="l")

  cols=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  plot(df.power$DateTime,df.power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(df.power$DateTime, df.power$Sub_metering_2,type="l",col="red")
  lines(df.power$DateTime, df.power$Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,lwd=1,col=c("black","blue","red"),legend=cls,bty="n")

  plot (df.power$DateTime,df.power$Voltage, type="l",xlab="datetime",ylab="Voltage")

  plot (df.power$DateTime, df.power$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()



#png(filename = "plot1.png",width=480,height=480,units="px")
plot(df.power$DateTime,df.power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#dev.off()


