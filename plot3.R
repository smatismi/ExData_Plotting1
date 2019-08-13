#R code for generationg plot3

df <- read.csv("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to Jan and Feb 2007
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(df1$Date), df1$Time)
df1$Datetime <- as.POSIXct(datetime)
# create Plot 3
with(df1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_Metering_2~Datetime,col='Red')
  lines(Sub_Metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
#send plot to file
png("plot3.png", width=480, height=480)
dev.off()