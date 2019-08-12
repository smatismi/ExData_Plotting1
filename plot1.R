#R code for generationg plot1

#read data from file
df <- read.csv("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset data to Jan and Feb 2007
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date variables to Date classes
df1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
#plot data
hist(df1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#send plot to file
png("plot1.png", width=480, height=480)
dev.off()
