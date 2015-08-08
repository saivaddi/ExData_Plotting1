library(tools)
elecData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

elecData$Date = paste(elecData$Date, elecData$Time)
elecData$Date = strptime(elecData$Date,"%d/%m/%Y%H:%M:%S")

beginDate <- strptime("2007-02-01 00:00:01", "%Y-%m-%d %H:%M:%S")
endDate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

eeData <- subset(elecData, (Date >= beginDate) & (Date <= endDate))

png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(eeData$Date, as.numeric(eeData$Global_active_power),type="l",col='black',xlab=" ", ylab="Global Active Power")
plot(eeData$Date, as.numeric(eeData$Voltage),type="l",col='black',xlab="datetime", ylab="Voltage")
with(eeData, {
  plot(eeData$Date, eeData$Sub_metering_1, type='l', xlab = '', ylab = 'Energy Sub Metering')
  lines(eeData$Date, eeData$Sub_metering_2, col = 'red')
  lines(eeData$Date, eeData$Sub_metering_3, col = 'blue')
  legend("topright", legNames)
})
plot(eeData$Date, as.numeric(eeData$Global_reactive_power),type="l",col='black',xlab="datetime", ylab=names(eeData[4]))
dev.off()