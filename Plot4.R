## Create PNG file
png(file = "plot4.png", height = 480, width = 480)

## Set global graphic parameters
par (mfrow = c(2,2))

## Create date/time variable
DT <- as.POSIXct(paste(hpc_data$Date, hpc_data$Time, sep = " "))

## Create first two plots
with (hpc_data, {
        plot (DT, Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power")
        axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))
        plot (DT, Voltage, type = "l", xaxt = "n", xlab = "datetime")
        axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))
        }
)

## Create initial element of third plot (sub_metering_1)
plot (DT, hpc_data$Sub_metering_1,  
      xlab = "", ylab = "Energy sub metering", 
      type = "l",
      xaxt = "n"
)
axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))

## Add sub-metering 2 and 3 data to third plot in order
points(x = DT, y = hpc_data$Sub_metering_2, col = "red", type = "l")
points(x = DT, y = hpc_data$Sub_metering_3, col = "blue", type = "l")

## Add legend
legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create final plot
plot (DT, hpc_data$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))

## Close PNG file connection
dev.off()