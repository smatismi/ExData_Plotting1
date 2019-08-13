#R code for generationg plot4

df <- read.csv("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to Jan and Feb 2007
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
#convert the Date and Time variables to Date/Time classes
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(df1$Date), df1$Time)
df1$Datetime <- as.POSIXct(datetime)
# create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Reactive Power (kilowatts)",xlab="")
})

#send plot to file
png("plot4.png", width=480, height=480)
dev.off()