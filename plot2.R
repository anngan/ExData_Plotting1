#Setting directory to the one in which the downloaded file for the project can be found. Loading the required package.
setwd("C:/Users/Name/Desktop/datasciencecoursera")
library("data.table")

#Reading and organizing data: changing the date type, using POSIXct for date related functions, choosing the dates.
power2 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
power2[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power2[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power2 <- power2[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the graph and saving it into a png file.
png("plot2.png", width=480, height=480)
plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
