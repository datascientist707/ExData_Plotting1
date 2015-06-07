
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

# --- Plot 2

png("plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(data$Global_active_power~data$Datetime, 
     type="n",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

lines(data$Datetime, data$Global_active_power, type = "s")
dev.off()


