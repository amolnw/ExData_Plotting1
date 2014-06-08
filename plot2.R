## This script plots line graph of Global Active Power for 2 days 1/2/2007 and 2/2/2007

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
png(file = "plot2.png", width = 480, height = 480, units = "px")

## Set parameter to create only 1 graph
par(mfrow=c(1,1))

## Create line graph
plot(filtered_data$Time, filtered_data$Global_active_power, type = "l", , ylab = "Global Active Power (kilowatts)", xlab = "")

## Close graphics device
dev.off()