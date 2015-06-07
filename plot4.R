
# --- Read csv
alldata <- read.csv("../household_power_consumption.txt", 
                    header=T, sep=';', 
                    na.strings="?", stringsAsFactors=F, 
                    comment.char="", nrows=2075259, 
                    check.names=F, quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

# --- get selected dates of data
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

# --- Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# --- Plot 4
png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_rective_power",xlab="datetime")
})
dev.off()

