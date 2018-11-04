#Get data from source
power_consumption <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
#Read only the required subset of data
reqData <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date format
reqData$Date <- as.Date(reqData$Date, format="%d/%m/%Y")
#create DataTime column
dateTime <- paste(as.Date(reqData$Date), reqData$Time)
reqData$DateTime <- as.POSIXct(dateTime)
#plot line chart
png("plot2.png", width=480, height=480)
with (reqData,{plot(Global_active_power~DateTime, ylab="Global Active Power (kilowatts)", xlab="",type="l")})
dev.off()