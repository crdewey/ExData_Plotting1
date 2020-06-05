library("readr")

#read in the data

power <- read_csv2("household_power_consumption.txt")

# look at Date
str(power$Date)

# select data from the dates 2007-02-01 and 2007-02-02

febdata <- power[as.Date(power$Date, "%d/%m/%Y")<=as.Date("02/02/2007", "%d/%m/%Y") & as.Date(power$Date, "%d/%m/%Y")>=as.Date("01/02/2007", "%d/%m/%Y") ,]

#create datetime variable

febdata$datetime <- strptime(paste(febdata$Date, febdata$Time), format="%d/%m/%Y %H:%M:%S")

#look at datetime 
str(febdata$datetime)

#divide volage by 1000
febdata$Voltage2 <- febdata$Voltage%/%1000
# create plot4.png 


png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#top left
with(febdata, plot(datetime,as.numeric(febdata$Global_active_power), ylab = "Global Active Power", type='l',xlab=""))

#top right
plot (febdata$datetime,febdata$Voltage2, type='l',ylab = "Voltage",xlab = "datetime")

#bottom left
plot(febdata$datetime,febdata$Sub_metering_1, type='l',ylab = "Energy sub metering", xlab="")
lines(febdata$datetime,febdata$Sub_metering_2, col="red")
lines(febdata$datetime,febdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#bottom right
plot (febdata$datetime,febdata$Global_reactive_power, type='l', ylab = "Gobal_reactive_power", xlab ="datetime")


dev.off()

