# Reading in data

power_data <- read.csv2("household_power_consumption.txt", na.strings = "?")
power_data$date_formatted <-as.Date(power_data$Date,format="%d/%m/%Y")
power_subset <- subset(power_data, date_formatted > "2007-01-31")
power_subset2 <- subset(power_subset, date_formatted < "2007-02-03")
power_subset2$Global_active_power <- as.numeric(as.character(power_subset2$Global_active_power))
power_subset2$timedate <- strptime(paste(power_subset2$Date, power_subset2$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


# Plot 3

plot(power_subset2$timedate, power_subset2$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
