#download zipped .txt file from coursera link
txturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(txturl,temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
unlink(temp)
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subset_data$Sub_metering_1)
submetering2 <- as.numeric(subset_data$Sub_metering_2)
submetering3 <- as.numeric(subset_data$Sub_metering_3)
voltage <- as.numeric(subset_data$Voltage)
globalActivePower <- as.numeric(subset_data$Global_active_power)
globalReactivePower <- as.numeric(subset_data$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global Active Power")

dev.off()