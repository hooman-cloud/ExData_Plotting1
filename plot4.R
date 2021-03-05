rm(list = ls())

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")

data_desired <- subset(data_raw, data_raw$Date == "2007-02-01" | data_raw$Date == "2007-02-02")



png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfrow=c(2,2))    # set the plotting area into a 1*2 array


data_desired$weekday <- factor(weekdays(data_desired$Date))
data_desired$Time2 <- as.POSIXct(strptime(paste(data_desired$Date, data_desired$Time, sep = " "),format = "%Y-%m-%d %H:%M:%S"))


plot(data_desired$Time2, data_desired$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data_desired$Time2, as.numeric(data_desired$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(data_desired$Time2, as.numeric(data_desired$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy sub meeting")
lines(data_desired$Time2, as.numeric(data_desired$Sub_metering_2), col = "red")
lines(data_desired$Time2, as.numeric(data_desired$Sub_metering_3), col = "blue")

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1)

plot(data_desired$Time2, as.numeric(data_desired$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#dev.copy(png, file="plot4.png")
dev.off()