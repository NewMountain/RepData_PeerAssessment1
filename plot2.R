## Acquire the data 
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)
#subset for two days in February
df1 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
#Create a new column for the data
df1$Date <- strptime(paste(df1$Date,df1$Time), "%d/%m/%Y %H:%M:%S")
#Deal with R's peculiar data converstion decisions
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
#Now make the chart and save file
png(file="plot2.png",width=480,height=480,res=72)
plot(df1$Date,df1$Global_active_power, type="l",xlab= "",ylab="Global Active Power (kilowatts)",main = "")
#shut down this program
dev.off()

