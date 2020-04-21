library("lubridate")
library("dplyr")
setwd("XXX/")
colcls<-c(Date="character",Time="character",Global_active_power="numeric")
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
df1<-filter(df,Date=="1/2/2007"|Date=="2/2/2007")
df1<-mutate(df1,dat_tim=dmy_hms(paste(Date,Time)))
i<-3:9
df1[,i]<-apply(df1[,i],2,function(x) as.numeric(as.character(x)))

# plot 3
png(filename="plot3.png",width = 480, height = 480)
with(df1,plot(dat_tim,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(df1,lines(dat_tim,Sub_metering_2,type="l",col="red"))
with(df1,lines(dat_tim,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()

dev.set(2)
dev.cur()