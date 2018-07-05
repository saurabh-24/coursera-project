bst<-function(state,outcome){
  if(as.character(outcome)=="heart"){
    b<-a[[as.character(state)]]
    c<-as.numeric(as.character(b[,11]))
    low<-min(c, na.rm = TRUE)
    d<-as.character(b[,2])
    df<-data.frame(d,c)
    ans<-dplyr::filter(df,c==low)
    ans
  }else{
    b<-a[[as.character(state)]]
    c<-as.numeric(as.character(b[,23]))
    low<-min(c, na.rm = TRUE)
    d<-as.character(b[,2])
    df<-data.frame(d,c)
    ans<-dplyr::filter(df,c==low)
    ans
    
  }
}