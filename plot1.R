# Set the working directory
setwd("/Shubham/R/4. Exploratory Data Analysis")

# read the data
data <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",stringsAsFactors=FALSE, dec=".",header = TRUE)
head(data)

sub_Set_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

global_Active_Power <- as.numeric(sub_Set_Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
