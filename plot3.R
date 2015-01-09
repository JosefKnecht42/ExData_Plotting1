library(dplyr)
Sys.setlocale("LC_TIME", "English")

#read and filter the data
data_raw <- read.csv2(file="household_power_consumption.txt", header = TRUE)
data <- filter(data_raw,Date == "1/2/2007" | Date == "2/2/2007" )

#preparing the data
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Date_Time <- strptime(x=paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#making the plot
plot(data$Date_Time,data$Sub_metering_1,type="n",xlab = "", ylab = "Energy sub metering")
lines(data$Date_Time,data$Sub_metering_1)
lines(data$Date_Time,data$Sub_metering_2, col="red")
lines(data$Date_Time,data$Sub_metering_3, col="blue")

legend("topright", lty=1, cex=.6 ,col=c("black","red","blue"),legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))
#make the PNG File
dev.copy(device = png,file="plot3.png",height = 480, width = 480)
dev.off()
