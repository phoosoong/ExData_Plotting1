## use data from dates 2007-02-01 and 2007-02-02
#
# When loading the dataset into R, please consider the following:
#
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate
# of how much memory the dataset will require in memory before reading into R.
# Make sure your computer has enough memory (most modern computers should be
# fine).
#
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One
# alternative is to read the data from just those dates rather than reading in
# the entire dataset and subsetting to those dates.
#
# You may find it useful to convert the Date and Time variables to Date/Time
# classes in R using the strptime() strptime()  and as.Date() as.Date()
# functions.
#
# Note that in this dataset missing values are coded as ? ?.

## load data
filename <- "household_power_consumption.txt"

datTbl <- read.table(filepath, sep = ";", header = TRUE, na.strings = "?")

## subset data from date 2207-02-01, 2007-02-02
datTbl$Date <- as.Date(datTbl$Date, "%d/%m/%Y")
datTbl <- subset(datTbl, Date == as.Date("2007-02-01")
                 |Date == as.Date("2007-02-02"))
## plot 1
hist(datTbl$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

## combine Date and Time
dateTimeData = strptime(paste(datTbl$Date, datTbl$Time), "%Y-%m-%d %H:%M:%S")

## plot 2
plot(x = dateTimeData, y = datTbl$Global_active_power, type = "l",
     ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

## plot 3
plot(dateTimeData, datTbl[["Sub_metering_1"]], type="l", ylab="Energy Submetering", xlab="")
lines(dateTimeData, datTbl[["Sub_metering_2"]], type="l", col="red")
lines(dateTimeData, datTbl[["Sub_metering_3"]], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty=1, lwd=3, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

## plot 4

## layout 2 x 2
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## top left plot
plot(x = dateTimeData, y = datTbl$Global_active_power, type = "l",
     ylab="Global Active Power")

## top right plot
plot(x = dateTimeData, y = datTbl$Voltage, type = "l",
     ylab="Voltage")

## bottom left plot
plot(dateTimeData, datTbl[["Sub_metering_1"]], type="l", ylab="Energy Submetering", xlab="")
lines(dateTimeData, datTbl[["Sub_metering_2"]], type="l", col="red")
lines(dateTimeData, datTbl[["Sub_metering_3"]], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

## bottom right plot
plot(x = dateTimeData, y = datTbl$Global_reactive_power, type = "l",
     ylab="Global Reactive Power")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
