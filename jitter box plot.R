#==========================
#                         |
#     Jitter Boxplot      |
#                         |
#==========================

# 12/31/2021

# clear workspace
rm(list=ls())
dev.off()
cat("\014")

library("MASS")
library(dplyr)
library(ggplot2)
library(scales)
library(reshape)

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

df$Colonic <- with(df, pmax(RVC, LVC,LDC,RDC))
df$GC <- with(df, pmax(Colonic,Gastric))

gc1 <- filter(df, (GC>0))


ggplot (stack(gc1[1:5]), aes(x=ind, y=values)) +

  geom_boxplot( fill="lightblue", color="black", 
    outlier.color="red4", outlier.shape=NA,
    notch=FALSE) +
  labs(
    title=paste("Jitter boxplot of ulcer locations in ulcerated horses ( N=",nrow(gc1), ")"),
    x="Ulcer location",
    y="Ulcer grade"
  ) +
  #geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
  geom_jitter(shape=16, size=1, height=1, width = .2, color="blue1") +
  scale_y_continuous(limits = c(0, 4), oob = scales::squish) +
  stat_summary(fun=mean, geom="point", shape=23, size=7, stroke=1,
    color="black", fill="white") +
  theme(text=element_text(size=20))






