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

## PLotting Histogram

png("plot1.png")
hist(as.numeric(data$Global_active_power),col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

