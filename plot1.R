library(dplyr)
library(lubridate)
path<-"household_power_consumption.txt"
df <- read.table(path,T,sep=";",na.strings="?")
df<-rename(df,date=Date)
datecol=df$date
df$date=dmy(df$date)
df<-subset(df,date==dmy("01022007") | date==dmy("02022007"))
ytick<-seq(0,1200,200)
png(file="plot1.png",width=480, height=480)
par(mfrow=c(1,1))
with(df,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)"))
axis(side=2,at=ytick,labels=ytick)
dev.off()
