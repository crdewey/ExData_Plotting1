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


# create plot3.png 




png("plot3.png", width = 480, height = 480)

plot(febdata$datetime,febdata$Sub_metering_1, type='l',ylab = "Energy sub metering", xlab="")
lines(febdata$datetime,febdata$Sub_metering_2, col="red")
lines(febdata$datetime,febdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()

