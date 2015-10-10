# Script assumes the data file - "household_power_consumption.txt" - is in the working directory
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(as.character(plotdata$Date), as.character(plotdata$Time)), format = "%d/%m/%Y %H:%M:%S ")
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, as.numeric(as.character(plotdata$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(as.character(plotdata$Sub_metering_2)), col = "red")
lines(datetime, as.numeric(as.character(plotdata$Sub_metering_3)), col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
