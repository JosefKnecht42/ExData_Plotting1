library(dplyr)
Sys.setlocale("LC_TIME", "English")

#read and filter the data
data_raw <- read.csv2(file="household_power_consumption.txt", header = TRUE, na.strings = "?")
data <- filter(data_raw,Date == "1/2/2007" | Date == "2/2/2007" )

#preparing the data
data$Date_Time <- strptime(x=paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#making the plot1
par(mfrow = c(2, 2), oma = c(0, 0, 0, 0), cex.lab=0.7, cex.axis=0.7)

#plot 1
plot(data$Date_Time,data$Global_active_power,type="n",xlab = "", ylab = "Global Active Power")
lines(data$Date_Time,data$Global_active_power)
#plot 2
plot(data$Date_Time,data$Voltage,type="n",xlab = "datetime", ylab = "Voltage")
lines(data$Date_Time,data$Voltage)
#plot 3
plot(data$Date_Time,data$Sub_metering_1,type="n",xlab = "", ylab = "Energy sub metering")
lines(data$Date_Time,data$Sub_metering_1)
lines(data$Date_Time,data$Sub_metering_2, col="red")
lines(data$Date_Time,data$Sub_metering_3, col="blue")
legend("topright", y.intersp=0.8, bty="n",  lty=1, cex=.5 ,col=c("black","red","blue"),legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))
#plot 4
plot(data$Date_Time,data$Global_reactive_power,type="n",xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Date_Time,data$Global_reactive_power)

#make the PNG File
dev.copy(device = png,file="plot4.png",height = 480, width = 480)
dev.off()
