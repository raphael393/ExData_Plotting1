## To read the file in your wd

household <- read.csv("household_power_consumption.txt", 
                      header=TRUE, sep=";", na="?", stringsAsFactors = FALSE,
                      dec=".")

## Format the date
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

## Subset the data
household07 <- subset(household, Date >= "2007-02-01" & 
                        Date <= "2007-02-02")

##Reformat the day and the time 
datetime <- paste(household07$Date,household07$Time)
household07$Datetime <- as.POSIXct(datetime)

## Graph 3
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(household07,plot(Datetime,Sub_metering_1, xlab = "", 
                      ylab = "Energy sub metering", type="l"))
lines(Sub_metering_2~Datetime, household07, col="red")
lines(Sub_metering_3~Datetime, household07, col="blue")
legend("topright", col=c("black","red","blue"), lwd=2, lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off ()