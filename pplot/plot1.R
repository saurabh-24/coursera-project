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
hist(maindata$globalactivepower,col = "red",xlab = "Global Active Power(kilowatts)")
