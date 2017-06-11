#Setting directory to the one in which the downloaded file for the project can be found. Loading the required package.
setwd("C:/Users/Name/Desktop/datasciencecoursera")
library("data.table")

#Reading and organizing data: changing to date type and choosing the dates.
power1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
power1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
power1 <- power1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Creating the graph.
png("plot1.png", width=480, height=480)
hist(powerDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
