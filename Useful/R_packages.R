pkg_list <- c("reshape2", "Rcpp", "digest","shiny", "RODBC", "RSQLite","jpeg", "PythonInR","Lahman",
              "microbenchmark","png", "pryr", "rcorpora","qdap","data.table","devtools","openxlsx","dtplyr","leaftlet", 
              "ggplot2movies","ggthemes","ggthemr","extrafont", "cowplot", "ggrepel","plotly",
              "prettydoc","colorspace","installr","ggforce","GGally","googleVis","ggmap","tidyverse")

pkg_new <- pkg_list[!(pkg_list %in% installed.packages()[,"Package"])]
if(length(pkg_new)) install.packages(pkg_new)
rm(pkg_new, pkg_list)


# "tidyverse"
#========================================================================
# Import: c("readr", "readxl", "haven", "httr", "rvest", "xml2")
# Tidy: c("tibble", "tidyr")
# Transform: c("dplyr", "forcats", "hms", "lubridate", "stringr")
# Visualise: c("ggplot2")
# Model: c("broom", "modelr")
# # program: c("purrr", "magrittr")
#  
# 1.1.1
# broom, dplyr, forcats, ggplot2, haven, httr, hms, jsonlite, lubridate, magrittr, 
# modelr, purrr, readr, readxl, stringr, tibble, rvest, tidyr, xml2
# knitr, rmarkdown
