
df <- read.csv("household_power_consumption.txt",
            header=TRUE,
            sep=";",
            stringsAsFactors = FALSE,
            na.string = c("?"),
            colClasses=c("character","character","numeric","numeric","numeric",
                                                 "numeric","numeric","numeric","numeric"))

df <- subset(df,Date=="1/2/2007" | Date=="2/2/2007")

df$DateTime = as.POSIXct(strptime(paste(df$Date," ",df$Time,sep=""),"%d/%m/%Y %H:%M:%S"))

png(filename="plot3.png",width=480,height=480,bg="white")

plot_colors <- c("black","red","blue")

plot_names  <- c("Sub metering 1","Sub metering 2","Sub metering 3")

with(df,plot(DateTime,Sub_metering_1,type="l",col=plot_colors[1],
             ylab="Energy sub metering", xlab="Day of Week (German)"))

with(df,lines(DateTime,Sub_metering_2,type="l",col=plot_colors[2]))

with(df,lines(DateTime,Sub_metering_3,type="l",col=plot_colors[3]))

legend("topright", plot_names, cex=0.8, col=plot_colors, lty=c(1,1,1))

dev.off()