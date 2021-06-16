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
    
    # generate bins based on input$bins from ui.R
    
    thresh <- as.numeric(input$threshold)
    
    
    fil_hdf_ki2<<-filter(hdf_ki2,(log2Fold>thresh|log2Fold<(-thresh)))
    ggplot(hdf_ki2,mapping=aes(log2Fold,-log10(Pvalue)))+
      geom_point(fil_hdf_ki2,mapping=aes(log2Fold,-log10(Pvalue),
                color=abs(log2Fold)),alpha=0.8, size=2)+
      theme_classic()+
      scale_color_distiller(palette="BrBg",direction = 1)+guides(color="none")
    
  })
  observeEvent(
    input$do,{
      output$genes<- renderTable(fil_hdf_ki2)
      write.csv(fil_hdf_ki2,"list.csv")
    })
    
    
  
  
  
  
  
})