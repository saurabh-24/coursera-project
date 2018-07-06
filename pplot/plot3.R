## reading file
householdpower<-read.table("householdpower.txt",sep = ";")

##filtering dates
maindata<-dplyr::filter(householdpower,V1=="1/2/2007"|V1=="2/2/2007")

##creating datetime format
maindata$datetime<-strptime(paste(maindata$V1,maindata$V2),"%d/%m/%Y %H:%M:%S")

##converting data into numeric
maindata$globalactivepower<-as.numeric(as.character(maindata$V3))
maindata$globalreactive<-as.numeric(as.character(maindata$V4))
maindata$voltage<-as.numeric(as.character(maindata$V5))
maindata$submetering1<-as.numeric(as.character(maindata$V7))
maindata$submetering2<-as.numeric(as.character(maindata$V8))
maindata$submetering3<-as.numeric(as.character(maindata$V9))



##plotting
with(maindata,plot(datetime,submetering1,type="n",ylab="Energy sub metering"))
with(maindata,points(datetime,submetering1,type ="l"))
with(maindata,points(datetime,submetering2,type ="l",col="red"))
with(maindata,points(datetime,submetering3,type ="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
