#download zipped .txt file from coursera link
txturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(txturl,temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
unlink(temp)

subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#str(subSetData)
globalActivePower <- as.numeric(subset_data$Global_active_power)
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
