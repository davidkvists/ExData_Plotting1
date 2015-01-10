#Part 4
##Setting proper working directory
setwd(file.path("C:","Users","David","Documents","Financial Engineering","Coursera","Exploratory data analysis","Project1"))


##Downloading data for specific dates only
require(data.table)
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))

## adding another column with date&time and setting format

DT$V10 <- as.POSIXct(paste(DT$V1, DT$V2), format="%d/%m/%Y %H:%M:%S") 

##Creating plot plot4.png

par(mfrow=c(2,2))
#Global active power
plot(DT$V10,DT$V3, type="l", xlab="",ylab="Global Active Power")

#Voltage
plot(DT$V10,DT$V5, type="l", xlab="datatime",ylab="Voltage")
#Energy sub meterings

with(DT,plot(DT$V10,DT$V7, type="l", xlab="",ylab="Energy sub metering"))
lines(DT$V10,DT$V8, type="l", col="red")
lines(DT$V10,DT$V9, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=c(1,1))

#Global reactive power
plot(DT$V10,DT$V4, type="l", xlab="datatime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()



