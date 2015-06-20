
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  #obs <- reactive(as.numeric(unlist(strsplit(input$inputtext,",",fixed=TRUE))))
  #anyNAv <-reactive(any(is.na(obs())))
  
  
  output$text1 <- renderUI({
    obs    <- as.numeric(unlist(strsplit(input$inputtext,",",fixed=TRUE)))
    anyNAv <-any(is.na(obs))
    m<-max(obs)
    k<-length(obs)
    freqN<-m+(m/k)-1
    lowconfinv<-m/(0.975^(1/k))
    highconfinv<-m/(0.025^(1/k))
    bayesMean<-(m-1)*((k-1)/(k-2))
    bayesSD<-sqrt(((k-1)*(m-1)*(m-k+1))/((k-3)*((k-2)^2)) )
    #bayesEst
    if(!anyNAv){outtext<-paste0("Your observations were: ", paste(as.character(obs),collapse=","),".",
                        "<br/> This gives a frequentist solution of N=", format(freqN,digits=5),
                      " with a symmetric 95% confidence interval of [", format(lowconfinv,digits=5),",",
                      format(highconfinv,digits=5),"].",
                      "<br/> The Bayesian estimate of N is N=",format(bayesMean,digits=5),"±",format(bayesSD,digits=5)) }
    
    else{outtext<-"NA's detected, please correct your observations."}
    HTML(outtext)
  })

})
