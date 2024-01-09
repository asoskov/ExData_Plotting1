# Reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data)
df_selected <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
names(df_selected)

#Plot
par(mfrow = c(2, 2))
with(df_selected, {
  plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power")
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage")
  plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ DateTime, data = df_selected, col = "red")
  lines(Sub_metering_3 ~ DateTime, data = df_selected, col = "blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1)
  plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_reactive_power")
})

#Download
dev.copy(png, "plot4.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())