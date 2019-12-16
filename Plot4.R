data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))


par(mfrow = c(2, 2))
plot(x=data$DateTime, y=data$Global_active_power, 
     xlab = '', ylab = 'Global Active Power', 
     type = 'l')
plot(x=data$DateTime, y=data$Voltage, 
     xlab = 'datetime', ylab = 'Voltage', 
     type = 'l')
plot(x=data$DateTime, y=data$Sub_metering_1, 
     xlab = '', ylab = 'Energy sub metering', 
     type = 'l')
lines(x=data$DateTime, y=data$Sub_metering_2,col='red')
lines(x=data$DateTime, y=data$Sub_metering_3,col='blue')
legend("topright", col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1, cex = 0.6)
plot(x=data$DateTime, y=data$Global_reactive_power, 
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()