##Exploratory data analysis
##Project 1
##Part 1
##Setting proper working directory
setwd(file.path("C:","Users","David","Documents","Financial Engineering","Coursera","Exploratory data analysis","Project1"))

 
##loading data for specific dates only
require(data.table)
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
rowsToRead <- as.numeric(dtime)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread("household_power_consumption.txt" , nrows=0)))

# creating the first plot1.png
 
hist(as.numeric(DT[["Global_active_power"]]),main="Global active power",
     xlab="Global Active Power (killowatts)",ylab="Frequency",col='red')

dev.copy(png,file="plot1.png")
dev.off()
 

 
