
#plot3
setwd("C:/Users/daniela.dimichele/Desktop/coursera/Exploratory_data_Analysis_coursera")
data_full<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",nrows=2075259,
                    check.names = FALSE,stringsAsFactors =FALSE,comment.char ="",quote = '\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date (data1$Date,format="%d/%m/%Y")
datetime<- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

with(data1,{
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Energy SUb Metering",xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()



