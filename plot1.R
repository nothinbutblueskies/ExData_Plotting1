# Script assumes the data file - "household_power_consumption.txt" - is in the working directory
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(plotdata$Global_active_power)), col = "orangeRed", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
