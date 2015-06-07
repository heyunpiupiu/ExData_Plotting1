data1<-read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data1$Date <- as.Date(strptime(data1$Date,"%d/%m/%Y"))

data <- subset (data1, Date >= " 2007-02-01" & Date <= "2007-02-02")
data$Time <- format(data$Time, format = "%H:%M:%S", usetz = FALSE)

#plot1.png
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red", border="black",xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")
dev.off();
