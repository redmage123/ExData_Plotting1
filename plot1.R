# Read the data file in.  Any field with ? in it is considered to be NA. 

df.power <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F,
                     na.strings="?")

# Convert the Date field to a date class from a string

df.power$Date <- as.Date(df.power$Date,format="%d/%m/%Y")

#We only want the dates of 2/1/2007 and 2/2/2007, so we set our fences.
startD <- as.Date("02/01/2007",format="%d/%m/%Y")
endD <- as.Date("02/02/2007",format="%d/%m/%Y")

# Give us a time stamp 
df.power <- df.power[(df.power$Date >= startD) & (df.power$Date <= endD),]


# Now output the histogram to a png file.
png(filename = "plot1.png",width=480,height=480,units="px")
hist(df.power$Global_active_power,main="Global Active Power",xlab="Global active Power (kilowatts)",col="red")
dev.off()
