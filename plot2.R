# Set the working directory
setwd("/Shubham/R/4. Exploratory Data Analysis")

# read the data
data <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",stringsAsFactors=FALSE, dec=".",header = TRUE)
head(data)

sub_Set_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(sub_Set_Data$Date, sub_Set_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(sub_Set_Data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
