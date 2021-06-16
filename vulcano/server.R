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

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
      
        thresh <- as.numeric(input$threshold)
        pval<-filter(hdf_ki2,log2Fold>thresh)
        pval2<-filter(hdf_ki2,log2Fold<(-thresh))

      ggplot(hdf_ki2,mapping=aes(log2Fold,-log10(Pvalue)))+
        geom_point(alpha=0.3)+
        geom_point(pval2,mapping=aes(log2Fold,-log10(Pvalue)),color="red",alpha=.7)+ theme_classic()+
        geom_point(pval,mapping=aes(log2Fold,-log10(Pvalue)),color="red",alpha=.7)
       

    })

})
