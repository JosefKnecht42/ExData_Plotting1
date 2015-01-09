library(dplyr)
#read and filter the data
data_raw <- read.csv2(file="household_power_consumption.txt", header = TRUE)
data <- filter(data_raw,Date == "1/2/2007" | Date == "2/2/2007" )

#preparing the data
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#making the plot
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
#make the PNG File
dev.copy(device = png,file="plot1.png",height = 480, width = 480)
dev.off()
