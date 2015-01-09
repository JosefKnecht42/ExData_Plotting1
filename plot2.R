library(dplyr)
Sys.setlocale("LC_TIME", "English")

#read and filter the data
data_raw <- read.csv2(file="household_power_consumption.txt", header = TRUE)
data <- filter(data_raw,Date == "1/2/2007" | Date == "2/2/2007" )
#preparing the data
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Date_Time <- strptime(x=paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#making the plot
plot(data$Date_Time,data$Global_active_power,type="n",xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Date_Time,data$Global_active_power)

#make the PNG File
dev.copy(device = png,file="plot2.png",height = 480, width = 480)
dev.off()
