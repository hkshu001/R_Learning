source("http://wush978.github.io/R/init-swirl.R")

Sys.setlocale(category = "LC_ALL", locale = "cht")
library(swirl)
swirl()


# swirl courses_20170124
# https://github.com/swirldev/swirl_courses

# Beginner
  # R Programming: The basics of programming in R
  # R Programming E: Same as the original, but modified slightly for in-class use (see below ***)
  # Data Analysis: Basic ideas in statistics and data visualization
  # Mathematical Biostatistics Boot Camp: One- and two-sample t-tests, power, and sample size
  # Open Intro: A very basic introduction to statistics, data analysis, and data visualization

# Intermediate
  # Regression Models: The basics of regression modeling in R
  # Getting and Cleaning Data: dplyr, tidyr, lubridate, oh my!

# Advanced
  # Statistical Inference: This intermediate to advanced level course closely follows 
    # the Statistical Inference course of the Johns Hopkins Data Science Specialization on Coursera. 
    # It introduces the student to basic concepts of statistical inference including probability, 
    # hypothesis testing, confidence intervals and p-values. It concludes with an initiation to 
    # topics of particular relevance to big data, issues of multiple testing and resampling.
  # Exploratory Data Analysis

# Manual to install
library(swirl)
install_course_zip("path/to/file/here/swirl_courses-master.zip", multi=TRUE, 
                   which_course="Course Name Here")

install_course_zip("c:/0 My documents/Dropbox/R tips/Swirl/swirl_courses-master.zip", multi=TRUE, 
                   which_course="Exploratory Data Analysis")

# Manual to install
uninstall_course("Course Name Here")




library(magrittr)
library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(ggplot2)
library(scales)