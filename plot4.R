## This script plots line graph of sub metering types for 2 days 1/2/2007 and 2/2/2007

## Read Data from downloaded txt
data <- read.table("data/household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric"))

## Filter Data for required two days from the loaded datsets
filtered_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Time from Time to DateTime format
filtered_data$Time <- strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S")

## Convert Date from Character to Date format
filtered_data$Date <- as.Date(filtered_data$Date, "%d/%m/%Y")

## Set Graphics Device to png
png(file = "plot4.png", width = 480, height = 480, units = "px")

## Set parameter to create only 4 graphs on single page
par(mfrow=c(2,2))

## Create graphs
with(filtered_data,{
    plot(filtered_data$Time, filtered_data$Global_active_power, type = "l", , ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(filtered_data$Time, filtered_data$Voltage, xlab="datetime", ylab="Voltage", type = "l")
    
    plot(filtered_data$Time, filtered_data$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "")
    lines(filtered_data$Time, filtered_data$Sub_metering_1)
    lines(filtered_data$Time, filtered_data$Sub_metering_2, col = "red")
    lines(filtered_data$Time, filtered_data$Sub_metering_3, col = "blue")
    legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
    
    plot(filtered_data$Time, filtered_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")
})

## Close graphics device
dev.off()