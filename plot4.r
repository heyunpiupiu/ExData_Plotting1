data1<-read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data1$Date <- as.Date(strptime(data1$Date,"%d/%m/%Y"))

data <- subset (data1, Date >= " 2007-02-01" & Date <= "2007-02-02")
data$Time <- format(data$Time, format = "%H:%M:%S", usetz = FALSE)
#data <- cbind(datetime=as.Date(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")),data)
data <- cbind(timestamp=format(as.POSIXct(paste(data$Date, data$Time)), "%d/%m/%Y %H:%M:%S"),data)

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(data$timestamp,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
points(data$timestamp,data$Global_active_power,type="l",lwd=1)

plot(data$timestamp,data$Voltage,xlab="datetime",ylab="Voltage")
points(data$timestamp,data$Voltage,type="l",lwd="1")

plot(data$timestamp,data$Sub_metering_1,type="l",lwd=1,col="black",ylab="Energy sub metering")
points(data$timestamp,data$Sub_metering_1,type="l",col="black")
points(data$timestamp,data$Sub_metering_2,type="l",col="red")
points(data$timestamp,data$Sub_metering_3,type="l",col="blue")
legend("topright",lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(data$timestamp,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power")
points(data$timestamp,data$Global_reactive_power,type="l",lwd=1)