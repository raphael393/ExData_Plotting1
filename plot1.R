## To read the file in your wd

household <- read.csv("household_power_consumption.txt", 
                      header=TRUE, sep=";", na="?", stringsAsFactors = FALSE,
                      dec=".")

## Format the date
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

## Subset the data
household07 <- subset(household, Date >= "2007-02-01" & 
                        Date <= "2007-02-02")

## Graph#1
hist(household07$Global_active_power, col = "red", main = "Global active power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off ()