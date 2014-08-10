## Acquire the data 
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)
#subset for two days in February
df1 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
#Create a new column for the data
df1$Date <- strptime(paste(df1$Date,df1$Time), "%d/%m/%Y %H:%M:%S")
#Deal with R's peculiar data converstion decisions
df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))
#Now make the chart and save file
png(file="plot3.png",width=480,height=480,res=72)
with(df1,plot(df1$Date,df1$Sub_metering_1, type="l",xlab= "",ylab="Energy sub metering",main = ""))
with(df1,lines(df1$Date,df1$Sub_metering_2,col="RED"))
with(df1,lines(df1$Date,df1$Sub_metering_3,col="BLUE"))
legend("topright",pch="-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#shut down this program
dev.off()
