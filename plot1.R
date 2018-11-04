#Get data from source
power_consumption <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
#Read only the required subset of data
reqData <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date format
reqData$Date <- as.Date(reqData$Date, format="%d/%m/%Y")
# plot histogram
png("plot1.png", width=480, height=480)
hist(reqData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
