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

#create plot 2

with(febdata, plot(datetime,as.numeric(febdata$Global_active_power), ylab = "Global Active Power (kilowatts)", type='l',xlab=""))


# create plot2.png 

dev.copy(png, file="plot2.png")
dev.off()
