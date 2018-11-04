#Get data from source
power_consumption <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?")
#Read only the required subset of data
reqData <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date format
reqData$Date <- as.Date(reqData$Date, format="%d/%m/%Y")
#create DataTime column
dateTime <- paste(as.Date(reqData$Date), reqData$Time)
reqData$DateTime <- as.POSIXct(dateTime)

png("plot4.png", width=480, height=480)
#set plot rows & columns, margin 

par(mfrow=c(2,2), mar=c(4,4,2,1))

# plot 4 charts as specified



with(reqData, {plot(Global_active_power~DateTime, type="l",ylab="Global Active Power", xlab="")
        plot(Voltage~DateTime, ylab="Voltage", xlab="datetime",  type="l")
        plot(Sub_metering_1~DateTime, xlab="", ylab="Energy sub metering", type="l", col="black")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l",ylab="Global_reactive_power",xlab="datetime")})

dev.off()