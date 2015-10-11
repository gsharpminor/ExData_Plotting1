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

#Second graph, final form:
png(file = "plot2.png", width = 480, height = 480)
plot(b$exacttime, b$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(b$exacttime, b$Global_active_power)
dev.off()
