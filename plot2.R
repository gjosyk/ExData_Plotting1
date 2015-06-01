# read the data
powerdata <- read.table("~/household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
# format the date
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
# filter the date value based on the given dates
powerdata <- powerdata[powerdata$Date == '2007-02-01' | powerdata$Date == '2007-02-02',]
# loop through the variables
# 3 - Global Active Power
# 4 - Global Reactive Power
# 5 - Voltage
# 6 - Global Intensity
# 7 - Sub-metering No. 1
# 8 - Sub-metering No. 2
# 9 - Sub-metering No. 3
for(i in 3:9) powerdata[,i] <- as.numeric(powerdata[,i])

# Plot the data
png("plot2.png")
with(powerdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))
dev.off()