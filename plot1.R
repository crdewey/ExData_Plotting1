getwd()
setwd("Exploratory Data Analysis")

library("readr")

#read in the data

power <- read_csv2("household_power_consumption.txt")

# convert date and time variables

power$Time2 <- strptime(power$Time, '%H:%M')

power$Date2 <- as.Date(power$Date,"%d/%m/%Y")

#convert Global_active_power to numeric

str(as.numeric(power$Global_active_power))

# select data from the dates 2007-02-01 and 2007-02-02

febdata <- power[power$Date2<=as.Date("2007-02-02") & power$Date2>=as.Date("2007-02-01") ,]

#create histogram 

hist(as.numeric(febdata$Global_active_power),col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# create plot1.png 

dev.copy(png, file="plot1.png")
dev.off()

