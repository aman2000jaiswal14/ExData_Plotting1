library(dplyr)
library(lubridate)
path<-"household_power_consumption.txt"
df <- read.table(path,header=T,sep=";",na.strings="?")
df<-rename(df,date=Date,time=Time)
df$date=dmy(df$date)
df<-subset(df,date==dmy("01022007") | date==dmy("02022007"))
df$datetime<-paste(as.character(df$date),df$time,sep=" ")
df$datetime<-ymd_hms(df$datetime)
png(file="plot2.png",width=480, height=480)
par(mfrow=c(1,1))
with(df,plot(datetime,Global_active_power,type='l',
             ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
