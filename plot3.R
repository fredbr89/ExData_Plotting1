# Reading the table and selecting the data
data <- read.table('household_power_consumption.txt', sep = ';', header=TRUE)
data2<- subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

#Making data being interpreted as numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))
data2$Datetime <-paste(data2$Date, data2$Time)

#Creating the .png file for plot3
png('plot3.png', width=480, height=480)

#Editing the plot
plot(strptime(data2$Datetime, '%d/%m/%Y %H:%M:%S'), data2$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(strptime(data2$Datetime, '%d/%m/%Y %H:%M:%S'), data2$Sub_metering_2, type = 'l', col='red')
lines(strptime(data2$Datetime, '%d/%m/%Y %H:%M:%S'), data2$Sub_metering_3, type = 'l', col='blue')
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
