data <- read.table("household_power_consumption.txt", header = F,
                   sep =";",skip = 66637, nrows = 2880,
                   col.names=c("Date","Time","Global_active_power",
                               "Global_reactive_power","Voltage",
                               "Global_intensity","Sub_metering_1",
                               "Sub_metering_2","Sub_metering_3"),
                   stringsAsFactors= F, na.strings = "?")
data$Date_Time <- strptime(paste(data$Date, data$Time),
                           format ="%d/%m/%Y %H:%M:%S")
head(data)
tail(data)

png(filename="plot2.png")
with(data, plot(Date_Time, Global_active_power, type ="l",main = "plot2",
                ylab="Global Active Power (kilowatts)"))
dev.off()