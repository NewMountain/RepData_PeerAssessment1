## Acquire the data 
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)
#subset for two days in February
df1 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
#Create a new column for the data
df1$Date <- strptime(paste(df1$Date,df1$Time), "%d/%m/%Y %H:%M:%S")
#Deal with R's peculiar data conversion decisions
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))
df1$Voltage <- as.numeric(as.character(df1$Voltage))
df1$Global_reactive_power <- as.numeric(as.character(df1$Global_reactive_power))
#Now make the chart and save file
png(file="plot4.png",width=480,height=480,res=72)
par(mfrow = c(2,2))
#Make chart 1
plot(df1$Date,df1$Global_active_power, type="l",xlab= "",ylab="Global Active Power (kilowatts)",main = "")
#Make chart 2
plot(df1$Date,df1$Voltage, type="l",xlab= "datetime",ylab="Voltage",main = "")
#Make chart 3
plot(df1$Date,df1$Sub_metering_1, type="l",xlab= "",ylab="Energy sub metering",main = "")
lines(df1$Date,df1$Sub_metering_2,col="RED")
lines(df1$Date,df1$Sub_metering_3,col="BLUE")
legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Make chart 4
plot(df1$Date,df1$Global_reactive_power, type="l",xlab= "datetime",ylab="Global_reactive_power",main = "")
#Close down program
dev.off()
