
library("readr")

#read in the data

power <- read_csv2("household_power_consumption.txt")


# select data from the dates 2007-02-01 and 2007-02-02

febdata <- power[as.Date(power$Date, "%d/%m/%Y")<=as.Date("02/02/2007", "%d/%m/%Y") & as.Date(power$Date, "%d/%m/%Y")>=as.Date("01/02/2007", "%d/%m/%Y") ,]

#create histogram 
#converting Global_active_power to numeric

hist(as.numeric(febdata$Global_active_power),col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# create plot1.png 

dev.copy(png, file="plot1.png")
dev.off()

