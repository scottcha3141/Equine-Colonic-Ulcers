#==========================
#                         |
#       Pie Charts        |
#                         |
#==========================

# 12/31/2021

# clear workspace
rm(list=ls())
dev.off()
cat("\014")

library(ggplot2)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
getwd()

df <- read.csv("C575.csv")
df$C <- with(df, Q1+Q2+Q3+Q4)

tcount <- nrow(df)
gcount <- length(which((df$G > 0) & (df$C == 0) ))

ccount <- length(which((df$C > 0) & (df$G == 0) ))

ncount <- length(which((df$G+df$C) == 0))

bcount <- length(which((df$G>0) & (df$C>0)))

piedf <- data.frame(
  group = c("none", "gastric", "both", "colonic"),
  value = c(ncount, gcount, bcount, ccount) 
)

head(piedf) 

ggplot(piedf, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)





