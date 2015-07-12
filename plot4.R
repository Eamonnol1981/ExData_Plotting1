# Reading in data

power_data <- read.csv2("household_power_consumption.txt", na.strings = "?")
power_data$date_formatted <-as.Date(power_data$Date,format="%d/%m/%Y")
power_subset <- subset(power_data, date_formatted > "2007-01-31")
power_subset2 <- subset(power_subset, date_formatted < "2007-02-03")
power_subset2$Global_active_power <- as.numeric(as.character(power_subset2$Global_active_power))
power_subset2$timedate <- strptime(paste(power_subset2$Date, power_subset2$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")



# Plot 4

power_subset2$Voltage <- as.numeric(as.character(power_subset2$Voltage))
power_subset2$Global_reactive_power <- as.numeric(as.character(power_subset2$Global_reactive_power))


par(mfrow = c(2, 2))
plot(power_subset2$timedate, power_subset2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power_subset2$timedate, power_subset2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power_subset2$Sub_metering_1,type = "l", ylab = "Energy sub metering")
lines(power_subset2$Sub_metering_2,type = "l",col="red")
lines(power_subset2$Sub_metering_3,type = "l",col="blue")
legend("topright", bty = "n", legend = c("Sub metering_1", "Sub metering_2", "Sub metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

plot(power_subset2$timedate, power_subset2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()