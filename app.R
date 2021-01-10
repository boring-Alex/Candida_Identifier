ID<-read.table("ID.txt", sep="\t", header=T, row.names=1, dec=",")
library('ape')
graph=function (ID){
	dd=dist(ID, method="euclidean")
	hc=hclust(dd, method="ward.D2")
	plot(as.phylo(hc), cex=.8, label.offset=.5, main="Иерархическое древо Candida sp.")
}
ui<-fluidPage(

titlePanel("Добро пожаловать в идентификатор Candida 21"),

fluidRow(
	column(2,textInput("sampleNum", h6("Введите номер образца"), value="")),
	column(2,textInput("sampleSource", h6("Источник образца"), value="")),
	column(2,dateInput("sampleDate", h6("Введите дату образца"), value="2020-01-08")),
	column(2,textInput("sampleType", h6("Тип образца"), value=""))),
fluidRow(
	column(2,radioButtons("NGA", h6("NGA"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("α-GAL", h6("α-GAL"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("PRO", h6("PRO"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("PGUR", h6("PGUR"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("PHE", h6("PHE"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("α-GLU", h6("α-GLU"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("β-GLU", h6("β-GLU"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0))),
fluidRow(
	column(2,radioButtons("URE", h6("URE"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("MEL", h6("MEL"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("XYL", h6("XYL"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("RHA", h6("RHA"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("GENA", h6("GENA"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("GLU", h6("GLU"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("INO", h6("INO"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0))),
fluidRow(
	column(2,radioButtons("CEL", h6("CEL"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("SUC", h6("SUC"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("TRE", h6("TRE"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("GAL", h6("GAL"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("MALA", h6("MALA"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("LAC", h6("LAC"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0)),
	column(2,radioButtons("RAF", h6("RAF"), choices = list("Отриц." = 0, "Положит." = 1), selected = 0))),
mainPanel(plotOutput("graph"))

)

server <- function(input, output) {

output$graph <- renderPlot({
    graph(ID)
  })

}

shinyApp(ui = ui, server = server)
