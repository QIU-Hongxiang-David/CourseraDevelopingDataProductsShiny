library(shiny)

shinyServer(
    function(input,output){
        output$okind<-renderPrint({
            switch(as.numeric(input$kind),"Probability","Density","Quantile")
            })
        output$omu<-renderPrint({as.numeric(input$mu)})
        output$osd<-renderPrint({as.numeric(input$sd)})
        output$oknown<-renderPrint({as.numeric(input$known)})
        output$oresult<-renderPrint({
            input$button
            isolate(switch(as.numeric(input$kind),
                           pnorm(as.numeric(input$known),as.numeric(input$mu),as.numeric(input$sd)),
                           dnorm(as.numeric(input$known),as.numeric(input$mu),as.numeric(input$sd)),
                           qnorm(as.numeric(input$known),as.numeric(input$mu),as.numeric(input$sd)))
                    )
        })
        output$plot<-renderPlot({
            input$button
            isolate({
                lim<-max(3*as.numeric(input$sd),
                         abs(as.numeric(input$known)-as.numeric(input$mu))+1)
                q<-seq(from = as.numeric(input$mu)-lim,
                       to = as.numeric(input$mu)+lim,
                       length.out = 100)
                plot(q,dnorm(q,as.numeric(input$mu),as.numeric(input$sd)),
                     type = "l",xlab = "x",ylab = "density",col="blue")
                abline(v = switch(as.numeric(input$kind),as.numeric(input$known),
                                  as.numeric(input$known),
                                  qnorm(as.numeric(input$known))))
            })
        })
    }
)