pkg_list <- c("ggplot2", "plyr", "dplyr", "reshape2", "Rcpp", "digest", "stringr",
  "lubridate","knitr", "shiny", "RODBC", "RSQLite", "rmarkdown",
  "broom","jpeg", "jsonlite", "PythonInR","Lahman", "microbenchmark",
  "png", "pryr", "purrr", "rcorpora", "readr",  "tibble", "tidyr",
  "qdap","magrittr","data.table","devtools","readxl","openxlsx","dtplyr","leaftlet", 
  "ggplot2movies","ggthemes","ggthemr","extrafont", "cowplot", "ggrepel","plotly",
  "prettydoc","colorspace","installr", "httr","jsonlite","rvest")

pkg_new <- pkg_list[!(pkg_list %in% installed.packages()[,"Package"])]
if(length(pkg_new)) install.packages(pkg_new)
rm(pkg_new, pkg_list)


