rm(list = ls())

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")

data_desired <- subset(data_raw, data_raw$Date == "2007-02-01" | data_raw$Date == "2007-02-02")

data_desired$Global_active_power <- as.numeric(data_desired$Global_active_power)
data_desired$weekday <- factor(weekdays(data_desired$Date))
data_desired$Time2 <- as.POSIXct(strptime(paste(data_desired$Date, data_desired$Time, sep = " "),format = "%Y-%m-%d %H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(data_desired$Time2, data_desired$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


#dev.copy(png, file="plot2.png", width=480, height=480, bg = "transparent")
dev.off()