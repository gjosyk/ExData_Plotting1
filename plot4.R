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
png("plot4.png")
par(mfrow=c(2,2))
with(powerdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_active_power,type='l',xlab="",
               ylab = 'Global Active Power (kilowatts)'))
with(powerdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,
               type='l',xlab='datetime',ylab='Voltage'))
with(powerdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(powerdata,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(powerdata,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
with(powerdata,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),
               Global_reactive_power,type='l',xlab='datetime'))
dev.off()