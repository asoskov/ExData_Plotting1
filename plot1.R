# Reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data)
df_selected <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')
# Hist
hist(df_selected$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Download
dev.copy(png, "plot1.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())
