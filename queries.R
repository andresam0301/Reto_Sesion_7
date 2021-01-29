library(DBI)
install.packages("RMySQL")
library(RMySQL)
MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
dbListTables(MyDataBase)
dbListFields(MyDataBase,"CountryLanguage")
db=MyDataBase
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
names(DataDB)
espa <-  DataDB %>% filter(Language == "Spanish")
espa.fd<-as.data.frame(espa)
espa.fd%>% ggplot(aes(x=Percentage, y=CountryCode,fill=IsOfficial))+geom_bin2d()+coord_flip()
