mean_col<- function(file_a){
  
  b<- ncol(file_a)
  empty_vec<- vector(mode = "numeric",length = b)
  
  for(i in 1:b){
    empty_vec[i]<- mean(file_a[,i])
  }
  
  empty_vec
}