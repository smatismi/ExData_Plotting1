#R code for generationg plot2

df <- read.csv("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to Jan and Feb 2007
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
#convert the Date and Time variables to Date/Time classes
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(df1$Date), df1$Time)
df1$Datetime <- as.POSIXct(datetime)
# create Plot 2
with(df1, {plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
})
#send plot to file
png("plot2.png", width=480, height=480)
dev.off()
