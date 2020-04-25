getwd()
setwd("C:/School/Online/Data Science/Quizzes/C4W1")
list.files()

data <- read.table('household_power_consumption.txt', sep=';')
dim(data)
names(data) <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(data)
head(data)

sub <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
dim(sub)


png("plot1.png")
dev.cur()
hist(as.numeric(as.character(sub$Global_active_power)), 
     ylim = c(0,1300), 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()

png("plot2.png")
dev.cur()
len <- nrow(sub)
plot(1:len, as.numeric(as.character(sub$Global_active_power)), type="l",
     xaxt = 'n',
     ylab = "Global Active Power (kilowatts)",
     xlab = NA)
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))
dev.off()

png("plot3.png")
len <- nrow(sub)
plot(1:len, as.numeric(as.character(sub$Sub_metering_1)), 
     type = 'l',
     xaxt = 'n',
     ylab = 'Energy sub metering',
     xlab = NA)
lines(1:len, as.numeric(as.character(sub$Sub_metering_2)), col = "red")
lines(1:len, as.numeric(as.character(sub$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))
dev.off()

png("plot4.png")
dev.cur()
par(mfrow = c(2, 2))

plot(1:len, as.numeric(as.character(sub$Global_active_power)), type="l",
     xaxt = 'n',
     ylab = "Global Active Power (kilowatts)",
     xlab = NA)
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))

plot(1:len, as.numeric(as.character(sub$Voltage)), type="l",
     xaxt = 'n',
     ylab = "Voltage",
     xlab = "datetime")
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))

plot(1:len, as.numeric(as.character(sub$Sub_metering_1)), 
     type = 'l',
     xaxt = 'n',
     ylab = 'Energy sub metering',
     xlab = NA)
lines(1:len, as.numeric(as.character(sub$Sub_metering_2)), col = "red")
lines(1:len, as.numeric(as.character(sub$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.7)
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))


plot(1:len, as.numeric(as.character(sub$Global_reactive_power)), type="l",
     xaxt = 'n',
     ylab = "Global_reactive_power",
     xlab = "datetime")
axis(1, at = c(1, len/2, len), labels = c("Thu", "Fri", "Sat"))
dev.off()