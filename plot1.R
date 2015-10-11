#Download the dataset:
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./PowerConsumption.zip", method="curl")

#Unzip the dataset:
unzip("./PowerConsumption.zip")
unlink("./PowerConsumption.zip", recursive=TRUE)

#Load the dataset into R:
a <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Trim away the timepoints we won't need:
beg <- which(a[,1] == "1/2/2007" & a[,2] == "00:00:00")
end <- which(a[,1] == "2/2/2007" & a[,2] == "23:59:00")
a <- a[beg:end,]
row.names(a) <- c(1:dim(a)[1])

#Combine the "date" and "time" columns into a single time column; create a new frame with this:
library(lubridate)
z <- dmy_hms(paste(a[,1], a[,2]))
b <- cbind(z, a[,3:9])
colnames(b)[1] <- "exacttime"

#First graph, final form:
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(b$Global_active_power), main = "Global Active Power", col = "red", breaks = 15,
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> 414e2593c8ff3439022fcfbad12452251079c2a9
