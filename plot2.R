
# --- Read csv
alldata <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

# --- get selected dates of data
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

