#download zipped .txt file from coursera link
txturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(txturl,temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
unlink(temp)

subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#str(subSetData)
globalActivePower <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

