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
shinyServer(function(input, output,session) {
  
  output$distPlot <- renderPlot({
    
    
    
    thresh <- as.numeric(input$threshold)
  
    
    fil_hdf_ki2<<-filter(hdf_ki2,(log2Fold>thresh|log2Fold<(-thresh)))
    plot_ly(fil_hdf_ki2,x=~log2Fold, y=~-log10(Pvalue), type="scatter", 
            mode="markers",marker=list(size=5,alpha=0.3,colors = "BrBG", color=~abs(log2Fold)), 
            text=~Symbol, hovertemplate=paste("<b>%{text}</b>","<extra></extra>"))
    
  })
  
     
  
})