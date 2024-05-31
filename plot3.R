## load data
filename <- "household_power_consumption.txt"

datTbl <- read.table(filepath, sep = ";", header = TRUE, na.strings = "?")

## subset data from date 2207-02-01, 2007-02-02
datTbl$Date <- as.Date(datTbl$Date, "%d/%m/%Y")
datTbl <- subset(datTbl, Date == as.Date("2007-02-01")
                 |Date == as.Date("2007-02-02"))

## combine Date and Time
dateTimeData = strptime(paste(datTbl$Date, datTbl$Time), "%Y-%m-%d %H:%M:%S")

## plot 3
plot(dateTimeData, datTbl[["Sub_metering_1"]], type="l", ylab="Energy Submetering", xlab="")
lines(dateTimeData, datTbl[["Sub_metering_2"]], type="l", col="red")
lines(dateTimeData, datTbl[["Sub_metering_3"]], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=3, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()