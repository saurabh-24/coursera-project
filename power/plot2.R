#reading original data source

originalData<-read.table("householdpower.txt")

#################creating a new data set#####################

#splitting the origibalData
o1<-strsplit(as.character(originalData$V1),"\\;")

##creating date
date<-c()
for(i in 1:length(ol)){
  date[i]<-ol[[i]][1]
}
date1<-sub("/","0",date)
date2<-sub("/","",date1)
date3<-paste("0",date2)
maindate<-ymd(date3)



##creating global active power
globalactivepower<-c()
for(i in 1:length(ol)){
  globalactivepower[i]<-ol[[i]][3]
}

##creating time
time<-c()
for(i in 1:length(ol)){
  time[i]<-ol[[i]][2]
}

##creating global reactive 
globalreactive<-c()
for(i in 1:length(ol)){
  globalreactive[i]<-ol[[i]][4]
  
}

##creating voltage
voltage<-c()
for(i in 1:length(ol)){
  voltage[i]<-ol[[i]][1]
}

##creating energy sub merging
subm1<-c()
subm2<-c()
subm3<-c()
for(i in 1:length(ol)){
  subm1[i]<-ol[[i]][7]
  subm2[i]<-ol[[i]][8]
  subm3[i]<-ol[[i]][9]
}

######converting all data into numeric###########
globalactivepower<-as.numeric(globalactivepower)
globalreactive<-as.numeric(globalreactive)
subm1<-as.numeric(subm1)
subm2<-as.numeric(subm2)
subm3<-as.numeric(subm3)


##################main data#################
maindata<-data.frame(maindate,time,globalactivepower,globalreactive,voltage,subm1,subm2,subm3)


############plotting#########
with(maindata,plot(time,globalactivepower,xlab="",ylab ="Global active power(kilowatts"))



