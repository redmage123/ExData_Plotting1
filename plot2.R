# Read the data file in.  Any field with ? in it is considered to be NA. 
df.power <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                     na.strings="?")

# Convert the Date field to a date class from a string
df.power$Date <- as.Date(df.power$Date,"%d/%m/%Y")

#We only want the dates of 2/1/2007 and 2/2/2007, so we set our fences.

startD <- as.Date("02/01/2007","%d/%m/%Y")
endD <- as.Date("02/02/2007","%d/%m/%Y")


# Limit our data frame to those records containing the two dates. 

df.power <- df.power[(df.power$Date >= startD) & (df.power$Date <= endD),]

# Give us a time stamp 
df.power$DateTime <- strptime(paste(format(df.power$Date,"%d/%m/%Y %H:%M:%S"),df.power$Time),format="%d/%m/%Y %H:%M:%S")


# Now output the plot to a png file.

png(filename = "plot1.png",width=480,height=480,units="px")
plot(df.power$DateTime,df.power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
