data1<-read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data1$Date <- as.Date(strptime(data1$Date,"%d/%m/%Y"))

data <- subset (data1, Date >= " 2007-02-01" & Date <= "2007-02-02")
data$Time <- format(data$Time, format = "%H:%M:%S", usetz = FALSE)
data <- cbind(timestamp=format(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S",usetz=FALSE),data)

#plot2.png
png(file="plot2.png",width=480,height=480)
plot(data$timestamp,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
points(data$timestamp,data$Global_active_power,type="l",lwd=1)
dev.off()