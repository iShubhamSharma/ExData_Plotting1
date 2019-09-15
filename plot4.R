# Set the working directory
setwd("/Shubham/R/4. Exploratory Data Analysis")

# read the data
data <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",stringsAsFactors=FALSE, dec=".",header = TRUE)
head(data)

sub_Set_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(sub_Set_Data$Date, sub_Set_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(sub_Set_Data$Global_active_power)
globalReactivePower <- as.numeric(sub_Set_Data$Global_reactive_power)
voltage <- as.numeric(sub_Set_Data$Voltage)
subMetering1 <- as.numeric(sub_Set_Data$Sub_metering_1)
subMetering2 <- as.numeric(sub_Set_Data$Sub_metering_2)
subMetering3 <- as.numeric(sub_Set_Data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
