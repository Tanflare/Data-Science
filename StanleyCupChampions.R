library(tidyverse)
library(rvest)

wiki <- read_html("https://en.wikipedia.org/wiki/List_of_Stanley_Cup_champions")

SC <- html_nodes(wiki, css = "table")

sc_data <- html_table(SC, header = T, fill = T)[[3]]
                 