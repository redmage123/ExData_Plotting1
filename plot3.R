# Read the data file in.  Any field with ? in it is considered to be NA. 
df.power <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                     na.strings="?")

# Convert the Date field to a date class from a string
df.power$Date <- as.Date(df.power$Date,"%d/%m/%y")

#We only want the dates of 2/1/2007 and 2/2/2007, so we set our fences.

startD <- as.Date("02/01/2007","%d/%m/%y")
endD <- as.Date("02/02/2007","%d/%m/%y")

# Limit our data frame to those records containing the two dates. 

df.power <- df.power[(df.power$Date <= startD) & (df.power$Date <= endD),]

# Give us a time stamp 
df.power$DateTime <- strptime(paste(format(df.power$Date,"%d/%m/%Y %H:%M:%S"),df.power$Time),format="%d/%m/%Y %H:%M:%S")


# Now output the plot to a png file.

png(filename = "plot1.png",width=480,height=480,units="px")
cols=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(df.power$DateTime,df.power$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(df.power$DateTime,df.power$Sub_metering_1,type="l",col="red")
lines(df.power$DateTime,df.power$Sub_metering_1,type="l",col="blue")
legend("topright",lty=1,lwd=1,col=c("black","blue","red"),legend=cols)
dev.off()


