## Create histogram with red bars plotting frequency of global active power (kilowatts)

png(file = "plot1.png", height = 480, width = 480)
hist(hpc_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
