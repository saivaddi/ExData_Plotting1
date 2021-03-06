library(tools)
elecData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

elecData$Date = paste(elecData$Date, elecData$Time)
elecData$Date = strptime(elecData$Date,"%d/%m/%Y%H:%M:%S")

beginDate <- strptime("2007-02-01 00:00:01", "%Y-%m-%d %H:%M:%S")
endDate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

eeData <- subset(elecData, (Date >= beginDate) & (Date <= endDate))

xlabel <- toTitleCase(gsub("_", " ", names(eeData)[3]))
xlabel <- paste(xlabel, "(kilowatts)")

png(filename = "plot1.png", width=480, height=480)
hist(as.numeric(eeData$Global_active_power),col='red',xlab=xlabel,main="Global Active Power")
dev.off()