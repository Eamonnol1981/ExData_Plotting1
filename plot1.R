# Reading in data

power_data <- read.csv2("household_power_consumption.txt", na.strings = "?")
power_data$date_formatted <-as.Date(power_data$Date,format="%d/%m/%Y")
power_subset <- subset(power_data, date_formatted > "2007-01-31")
power_subset2 <- subset(power_subset, date_formatted < "2007-02-03")



# Plot 1

power_subset2$Global_active_power <- as.numeric(as.character(power_subset2$Global_active_power))

hist(power_subset2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()