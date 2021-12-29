#==========================
#                         |
#       Statistics        |
#                         |
#==========================

# clear workspace
rm(list=ls())
dev.off()
cat("\014")

library("MASS")
library(dplyr)
library(ggplot2)
library(scales)
library(reshape)
library(psych)

# Read Data and reformat it

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
#getwd()
df <- read.csv("C575.csv")
df <- df %>% select(!Year)  # delete year column
names(df)[1] <- "Gastric"
names(df)[2] <- "RVC"
names(df)[3] <- "LVC"
names(df)[4] <- "LDC"
names(df)[5] <- "RDC"

describe(df)  
