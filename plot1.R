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