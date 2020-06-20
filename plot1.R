library(readr)
data<- read_delim("data/household_power_consumption.txt",";")
data$Date<-as.Date(data$Date,format ="%d/%m/%Y")

data2<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
data2$datetime<-as.POSIXct(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

hist(data2$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main= "Global Active Power")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
