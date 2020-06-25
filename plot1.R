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
data2$Date_time <-paste(data2$Date, data2$Time)

#Creating the .png file for plot1
png('plot1.png', width=480, height=480)

#Editing the plot
hist(data2$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
axis(2,seq(0,1200, by = 200))
dev.off()
