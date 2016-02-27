
df <- read.csv("household_power_consumption.txt",
            header=TRUE,
            sep=";",
            stringsAsFactors = FALSE,
            na.string = c("?"),
            colClasses=c("character","character","numeric","numeric","numeric",
                                                 "numeric","numeric","numeric","numeric"))

df <- subset(df,Date=="1/2/2007" | Date=="2/2/2007")

df$DateTime = as.POSIXct(strptime(paste(df$Date," ",df$Time,sep=""),"%d/%m/%Y %H:%M:%S"))

png(filename="plot1.png",width=480,height=480,bg="white")

with(df,hist(df$Global_active_power, main="Global Active Power", col="red",xlab="Global active Power (kilowatts)"))

dev.off()