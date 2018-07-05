> mean_pol<- function(diractory,pol,n=1:332){
     count<-1
     empty_vect<-c()
     for(i in n){
      
      
           
           one_file<-read.csv(file=files(i))
           
             s<-one_file[pol]
           
               without_na<- s[!is.na(s)]
               a<-without_na
               
              for(j in a){
               
                   empty_vect[count]<-j
                       count<- count+1
                     }
               
               }
     print(length(empty_vect))
     mean(empty_vect)
   }
 
   files<- function(n){
       if(n<=9){
           file_name<-paste("00",as.character(n),".csv",sep = "")
         }
       if(n>9&&n<99){
         file_name<-paste("0",as.character(n),".csv",sep = "")
         }
       if(n>99){
           file_name<-paste(as.character(n),".csv",sep="")
         }
      file_name
     }
  