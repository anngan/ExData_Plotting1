#Setting directory to the one in which the downloaded file for the project can be found. Loading the required package.
setwd("C:/Users/Name/Desktop/datasciencecoursera")
library("data.table")

#Reading and organising data: changing the date type, using POSIXct for date related functions, choosing the dates.
power3[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power3[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power3 <- power3[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Creating the graph and saving it into a png file.
png("plot3.png", width=480, height=480)
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()
