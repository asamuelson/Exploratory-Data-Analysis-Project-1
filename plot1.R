ElectricPower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
ElectricPowerData <- subset(ElectricPower, Date == "1/2/2007" | Date == "2/2/2007")
png("plot1.png")
hist(as.numeric(ElectricPowerData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
