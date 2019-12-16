data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))


plot(x=data$DateTime, y=data$Sub_metering_1, 
     xlab = '', ylab = 'Energy sub metering', 
     type = 'l')
lines(x=data$DateTime, y=data$Sub_metering_2,col='red')
lines(x=data$DateTime, y=data$Sub_metering_3,col='blue')
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()