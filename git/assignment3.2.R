n<-function(outcome,num){
  emp<-vector()
  count<-0
  for(state in 1:length(a)){
    emp<-vector()
    if(as.character(outcome)=="heart"){
      b<-a[[as.numeric(state)]]
      c<-as.character(b[,2])
      d<-suppressWarnings(as.numeric(as.character(b[,11])))
      
      
      df<-data.frame(c,d)
      
      dp1<-df[complete.cases(df), ]
      
      r<- rank(dp1$d,na.last = TRUE, ties.method = "min")
      
      dp<-dplyr::mutate(dp1,r)
      
      ans<-dplyr::filter(dp,r==num)
      
      emp<-as.character(ans[,1])

    }else{
      
      b<-a[[as.character(state)]]
      c<-as.character(b[,2])
      d<-suppressWarnings(as.numeric(as.character(b[,23])))
      
      
      df<-data.frame(c,d)
      
      dp1<-df[complete.cases(df), ]
      
      r<- rank(dp1$d,na.last = TRUE, ties.method = "min")
      
      dp<-dplyr::mutate(dp1,r)
      
      ans<-dplyr::filter(dp,r==num)
      emp<-as.character(ans[,1])
      
    }
  
  }
emp
}