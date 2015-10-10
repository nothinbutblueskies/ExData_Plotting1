# Script assumes the data file - "household_power_consumption.txt" - is in the working directory
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(as.character(plotdata$Date), as.character(plotdata$Time)), format = "%d/%m/%Y %H:%M:%S ")
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(as.character(plotdata$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
