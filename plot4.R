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

## Graph 4
par(mfrow=c(2,2))
##1st plot
with(household07,plot(Datetime,Global_active_power, xlab = "",
                      ylab = "Global Active Power (kilowatts)", type = "l"))
##2nd Plot
with(household07,plot(Datetime,Voltage,xlab = "datetime",ylab = "Voltage",type = "l"))
## 3rd Plot 
with(household07,plot(Datetime,Sub_metering_1, xlab = "", 
                      ylab = "Energy sub metering", type="l"))
lines(Sub_metering_2~Datetime, household07, col="red")
lines(Sub_metering_3~Datetime, household07, col="blue")
legend("topright", col=c("black","red","blue"), lwd=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##4th Plot
with(household07,plot(Datetime,Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l"))
dev.copy(png, "plot4.png")
dev.off ()
