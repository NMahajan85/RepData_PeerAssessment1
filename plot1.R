data <- read.table("household_power_consumption.txt", header = F,
                   sep =";",skip = 66637, nrows = 2880,
                   col.names=c("Date","Time","Global_active_power",
                               "Global_reactive_power","Voltage",
                               "Global_intensity","Sub_metering_1",
                               "Sub_metering_2","Sub_metering_3"),
                   stringsAsFactors= F, na.strings = "?")
head(data)
tail(data)

png(filename="plot1.png")
hist(data$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "Red" )
dev.off()



