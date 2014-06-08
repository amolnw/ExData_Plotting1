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
png(file = "plot3.png", width = 480, height = 480, units = "px")

## Set parameter to create only 1 graph
par(mfrow=c(1,1))

## Create Empty line graph
with(filtered_data, plot(filtered_data$Time, filtered_data$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = ""))

## Add sub metering line 1 to graph
with(filtered_data, lines(filtered_data$Time, filtered_data$Sub_metering_1))

## Add sub metering line 2 to graph
with(filtered_data, lines(filtered_data$Time, filtered_data$Sub_metering_2, col = "red"))

## Add sub metering line 3 to graph
with(filtered_data, lines(filtered_data$Time, filtered_data$Sub_metering_3, col = "blue"))

## Add legend to graph
legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='o', cex=.75)

## Close graphics device
dev.off()