## Create PNG file
png(file = "plot2.png", height = 480, width = 480)

## Create date/time variable
DT <- as.POSIXct(paste(hpc_data$Date, hpc_data$Time, sep = " "))

## Plot global active power (kilowatts) used over time period across the two days
plot (DT, hpc_data$Global_active_power, 
      xlab = "", ylab = "Global Active Power (kilowatts)", 
      type = "l",
      xaxt = "n"
      )

## Add tick marks and labels
axis (side = 1, at = c(min(DT), median(DT), max(DT)), labels = c("Thu", "Fri", "Sat"))

## Close PNG file connection
dev.off()