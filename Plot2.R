data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))


plot(x=data$DateTime, y=data$Global_active_power, 
     xlab = '', ylab = 'Global Active Power (kilowatt)', 
     type = 'l')

dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()