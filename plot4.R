
df <- read.csv("household_power_consumption.txt",
            header=TRUE,
            sep=";",
            stringsAsFactors = FALSE,
            na.string = c("?"),
            colClasses=c("character","character","numeric","numeric","numeric",
                                                 "numeric","numeric","numeric","numeric"))

df <- subset(df,Date=="1/2/2007" | Date=="2/2/2007")

df$DateTime = as.POSIXct(strptime(paste(df$Date," ",df$Time,sep=""),"%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png",width=480,height=480,bg="white")

par(mfrow=c(2,2))

#plot 1 1
with(df,plot(DateTime,Global_active_power,type="l", col="black",
             ylab="Global Active Power", xlab="Day of Week (German)"))
#plot 1 2
with(df,plot(DateTime,Voltage,type="l",col="black",
             ylab="Voltage", xlab="Day of Week (German)"))
#plot 1 3
plot_colors <- c("black","red","blue")

plot_names  <- c("Sub metering 1","Sub metering 2","Sub metering 3")

with(df,plot(DateTime,Sub_metering_1,type="l",col=plot_colors[1],
             ylab="Energy sub metering", xlab="Day of Week (German)"))

with(df,lines(DateTime,Sub_metering_2,type="l",col=plot_colors[2]))

with(df,lines(DateTime,Sub_metering_3,type="l",col=plot_colors[3]))

legend("topright", plot_names, cex=0.8, col=plot_colors, lty=c(1,1,1))

#plot 1 4
with(df,plot(DateTime,Global_reactive_power,type="l",col="black",
             ylab="Global Reactive Power", xlab="Day of Week (German)"))

dev.off()