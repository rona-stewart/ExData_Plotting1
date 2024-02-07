## Create PNG file
png(file = "plot3.png", height = 480, width = 480)

## Create date/time variable
DT <- as.POSIXct(paste(hpc_data$Date, hpc_data$Time, sep = " "))

## Create initial plot (sub_metering_1)
plot (DT, hpc_data$Sub_metering_1,  
      xlab = "", ylab = "Energy sub metering", 
      type = "l",
      xaxt = "n"
)
axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))

## Add sub-metering 2 and 3 data in order
points(x = DT, y = hpc_data$Sub_metering_2, col = "red", type = "l")
points(x = DT, y = hpc_data$Sub_metering_3, col = "blue", type = "l")

## Add legend
legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close PNG file connection
dev.off()