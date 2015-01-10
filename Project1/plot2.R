##Exploratory data analysis
##Project 1
#Part 2
##Setting proper working directory
setwd(file.path("C:","Users","David","Documents","Financial Engineering","Coursera","Exploratory data analysis","Project1"))


##Downloading data for specific dates only
require(data.table)
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))

## adding another column with date&time and setting format

DT$V10 <- as.POSIXct(paste(DT$V1, DT$V2), format="%d/%m/%Y %H:%M:%S") 

##Creating plot plot2.png
plot(DT$V10,DT$V3, type="l", xlab="",ylab="Global Active Power (killowatts)")
dev.copy(png,file="plot2.png")
dev.off()
