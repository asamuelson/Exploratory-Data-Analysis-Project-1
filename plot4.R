ElectricPower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
ElectricPowerData <- subset(ElectricPower, Date == "1/2/2007" | Date == "2/2/2007")
DatesAndTimes <- paste(ElectricPowerData$Date, ElectricPowerData$Time)
Times <- strptime(DatesAndTimes, format="%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow= c(2,2))
plot(Times, ElectricPowerData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Times, ElectricPowerData$Voltage, xlab = "datetime", ylab="Voltage", type="n")
lines(Times, ElectricPowerData$Voltage)

plot(Times, ElectricPowerData$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(Times, ElectricPowerData$Sub_metering_1, col="black")
lines(Times, ElectricPowerData$Sub_metering_2, col="red")
lines(Times, ElectricPowerData$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = 1, col=c("black", "red", "blue"))

plot(Times, ElectricPowerData$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="n")
lines(Times, ElectricPowerData$Global_reactive_power)

dev.off()