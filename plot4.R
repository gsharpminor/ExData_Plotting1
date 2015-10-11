#(Code for downloading the data is in plot1.R.)
#Load the dataset into R:
a <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Trim away the timepoints we won't need:
beg <- 66637
end <- 69516
a <- a[beg:end,]
row.names(a) <- c(1:dim(a)[1])

#Combine the "date" and "time" columns into a single time column; create a new frame with this:
library(lubridate)
z <- dmy_hms(paste(a[,1], a[,2]))
b <- cbind(z, a[,3:9])
colnames(b)[1] <- "exacttime"

#Fourth graph, final form:
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(2, 4, 4, 2))
with(b, {
       plot(b$exacttime, b$Global_active_power, type = "n", 
            xlab = "", ylab = "Global Active Power (kilowatts)")
       lines(b$exacttime, b$Global_active_power)
       plot(b$exacttime, b$Voltage, type = "n", 
            xlab = "datetime", ylab = "Voltage")
       lines(b$exacttime, b$Voltage)
       plot(b$exacttime, b$Global_active_power, type = "n", 
            xlab = "", ylab = "Energy sub metering", ylim=c(0, 40))
       lines(b$exacttime, b$Sub_metering_1, col = "black")
       lines(b$exacttime, b$Sub_metering_2, col = "red")
       lines(b$exacttime, b$Sub_metering_3, col = "blue")
       legend("topright", col = c("black", "blue", "red"), lwd = 1, 
              bty="n", cex = .35, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       plot(b$exacttime, b$Global_reactive_power, type = "n", 
            xlab = "datetime", ylab = "Global_reactive_power")
       lines(b$exacttime, b$Global_reactive_power)
})
par(mfrow = c(1, 1))
<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> 414e2593c8ff3439022fcfbad12452251079c2a9
