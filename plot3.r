data1<-read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data1$Date <- as.Date(strptime(data1$Date,"%d/%m/%Y"))

data <- subset (data1, Date >= " 2007-02-01" & Date <= "2007-02-02")
data$Time <- format(data$Time, format = "%H:%M:%S", usetz = FALSE)
data <- cbind(timestamp=format(as.POSIXct(paste(data$Date, data$Time)), "%d/%m/%Y %H:%M:%S"),data)

#plot3.png
png(file="plot3.png",width=480,height=480)
plot(data$timestamp,data$Sub_metering_1,type="l",lwd=1,col="black",ylab="Energy sub metering")
points(data$timestamp,data$Sub_metering_1,type="l",col="black")
points(data$timestamp,data$Sub_metering_2,type="l",col="red")
points(data$timestamp,data$Sub_metering_3,type="l",col="blue")
legend("topright",lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()