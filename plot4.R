library(readr)
data<- read_delim("data/household_power_consumption.txt",";")
data$Date<-as.Date(data$Date,format ="%d/%m/%Y")

data2<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
data2$datetime<-as.POSIXct(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME","C")

par(mfrow=c(2,2),mar=c(4,4,2,2))
#Sub-plot 1 
with(data2,plot(datetime,Global_active_power,type = "n",ylab = "Global Active Power",xlab=""))
lines(data2$datetime,data2$Global_active_power)

#Sub-plot 2 
with(data2,plot(datetime,Voltage,type="n"))
lines(data2$datetime,data2$Voltage)

#Sub-plot 3
with(data2,plot(datetime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab=""))
with(data2,lines(datetime,Sub_metering_1))
with(data2,lines(datetime,Sub_metering_2,col="red"))
with(data2,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",cex = 0.7)

#Sub-plot 4
with(data2,plot(datetime,Global_reactive_power,type="n"))
lines(data2$datetime,data2$Global_reactive_power)

dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()

