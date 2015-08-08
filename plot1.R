elecData <- read.table("../household_power_consumption.txt", sep=";", header=TRUE)

elecData <- transform(elecData, Date = as.Date(Date,"%d/%m/%Y"))

beginDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
print(names(elecData))

eeData <- subset(elecData, (Date >= beginDate) & (Date <= endDate))

png(filename = "plot1.png", width=480, height=480)
hist(as.numeric(eeData$Global_active_power),col='red',xlab=names(eeData)[3],main="Global Active Power")
dev.off()