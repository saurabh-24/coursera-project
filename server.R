#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    summarizer2<-function(doc, gamma) {
    
    # parse it into sentences
    sent <- stringi::stri_split_boundaries(doc, type = "sentence")[[ 1 ]]
    
    names(sent) <- seq_along(sent) # so we know index and order
    
    # embed the sentences in the model
    e <- CreateDtm(sent, ngram_window = c(1,1), verbose = FALSE, cpus = 2)
    
    vocab <- intersect(colnames(e), colnames(gamma))
    
    e <- e / rowSums(e)
    
    e <- e[ , vocab ] %*% t(gamma[ , vocab ])
    
    e <- as.matrix(e)
    
    e <- as.matrix(e)
    
    # get the pairwise distances between each embedded sentence
    e_dist <- CalcHellingerDist(e)
    
    # turn into a similarity matrix
    g <- (1 - e_dist) * 100
    
    # we don't need sentences connected to themselves
    diag(g) <- 0
    
    # turn into a nearest-neighbor graph
    g <- apply(g, 1, function(x){
      x[ x < sort(x, decreasing = TRUE)[ 3 ] ] <- 0
      x
    })
    
    # by taking pointwise max, we'll make the matrix symmetric again
    g <- pmax(g, t(g))
    
    g <- graph.adjacency(g, mode = "undirected", weighted = TRUE)
    output$here<-renderPlot({
      
      plot(g)
    })
    # calculate eigenvector centrality
    ev <- evcent(g)
    
    # format the result
    a<-input$Number
    result <- sent[ names(ev$vector)[ order(ev$vector, decreasing = TRUE)[ 1:a ] ] ]
    
    result <- result[ order(as.numeric(names(result))) ]
    return(paste(result, collapse = " "))
    
    }
    
  summr<-eventReactive(input$letsgo,{
    doc<-input$caption

    
    
    gamma<-embeddings$gamma
    summarizer2(doc,gamma)
    
  })
   
  output$value<-renderText({
    
    summr()
  })
    
  })
  

