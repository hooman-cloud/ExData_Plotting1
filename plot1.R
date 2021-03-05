rm(list = ls())

data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")

data_desired <- subset(data_raw, data_raw$Date == "2007-02-01" | data_raw$Date == "2007-02-02")

data_desired$Global_active_power <- as.numeric(data_desired$Global_active_power)
hist(data_desired$Global_active_power, breaks = 15, col = "red", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


dev.copy(png, file="plot1.png", width=480, height=480, bg = "transparent")
dev.off()