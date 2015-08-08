library(tools)
elecData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

elecData$Date = paste(elecData$Date, elecData$Time)
elecData$Date = strptime(elecData$Date,"%d/%m/%Y%H:%M:%S")

beginDate <- strptime("2007-02-01 00:00:01", "%Y-%m-%d %H:%M:%S")
endDate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

eeData <- subset(elecData, (Date >= beginDate) & (Date <= endDate))

ylabel <- toTitleCase(gsub("_", " ", names(eeData)[3]))
ylabel <- paste(ylabel, "(kilowatts)")

png(filename = "plot2.png", width=480, height=480)
plot(eeData$Date, as.numeric(eeData$Global_active_power),type="l",col='black',xlab="Day", ylab=ylabel,main="Global Active Power")
dev.off()