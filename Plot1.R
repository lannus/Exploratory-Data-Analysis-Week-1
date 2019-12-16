data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


hist(data$Global_active_power, 
     freq = TRUE, col = "red", 
     main = "Global Active Power",
     xaxt='n',
     xlab = "Global Active Power(kilowatts)")
axis(side=1, at=c(0,2,4,6), labels=c(0,2,4,6))


dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()