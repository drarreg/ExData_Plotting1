dataset <- read.table("household_power_consumption.txt", sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"), na.strings = "?", nrows = 3000, skip = 66600, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot2.png", width = 480, height = 480, units = "px")
par(mar=c(3,5,3,3), cex.axis = 0.8, cex.lab = 0.8, cex.main = 0.9)
plot(dataset$DateTime, dataset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()