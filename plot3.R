## Creating data directory, downloading and unzipping files
if(!dir.exists("./data")){
  dir.create("./data")
}
if(!file.exists("./data/ElectricData.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "./data/ElectricData.zip")
}
if (!file.exists("./data/household_power_consumption.txt")) {
  unzip("./data/ElectricData.zip",exdir = "./data")
}


## Reading and subsetting data

fulldata <- read.table("./data/household_power_consumption.txt",
                       sep = ";",header = TRUE)
data <- subset(fulldata,
               fulldata$Date == "1/2/2007" | fulldata$Date =="2/2/2007")

##plotting timeseries

datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

png("plot3.png")
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()