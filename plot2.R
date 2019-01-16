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

## Graph2
with(household07,plot(Datetime,Global_active_power, xlab = "", 
                      ylab = "Global Active Power (kilowatts)", type = "l"))
dev.copy(png, "plot2.png")
dev.off ()