#==========================
#                         |
#         Heatmap         |
#                         |
#==========================

# 12/31/2021

# clear workspace
rm(list=ls())
dev.off()
cat("\014")

library(MASS)
library(dplyr)
library(ggplot2)
library(scales)
library(reshape)
library(psych)
library(formattable)
library(Hmisc)
library(corrplot)

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

# options(digits=3)
# sTab <- describe(df)  
# sTab$vars <- NULL
# sTab$n <- NULL
# sTab$min <- NULL
# sTab$trimmed <- NULL
# sTab$mad <- NULL
# sTab$range <- NULL

#cTab <- rcorr(as.matrix(df))$r

cTab <- cor(df)
#cTab <- data.frame(round(cTab, 3))
palette = colorRampPalette(c("blue", "white", "red3")) (40)
heatmap(x = cTab, col = palette, symm = TRUE)

# formattable(cTab, caption="Correlations for ulcer locations (N=575)",
#   align=c("c","c","c","c"),
#   list(area(col = Gastric:RDC) ~ color_tile("transparent", "lightblue"))
# )


