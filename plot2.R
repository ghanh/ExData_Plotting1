# R version 3.6.2 (2019-12-12) -- "Dark and Stormy Night"
# Copyright (C) 2019 The R Foundation for Statistical Computing
# Platform: x86_64-w64-mingw32/x64 (64-bit)

# read and subset data
# setwd() to that containing the data file
data <- read.table('household_power_consumption.txt', sep=';')
names(data) <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
sub <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# generate the plot with base plotting
png("plot2.png")
len <- nrow(sub)
plot(1:len, as.numeric(as.character(sub$Global_active_power)), type="l",
     xaxt = 'n',
     ylab = "Global Active Power (kilowatts)",
     xlab = NA)
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))
dev.off()
