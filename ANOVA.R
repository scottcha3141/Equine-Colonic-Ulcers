#==========================
#                         |
#          ANOVA          |
#                         |
#==========================

# 12/31/2021

# clear workspace
rm(list=ls())
dev.off()
cat("\014")

# Read Data and reformat it

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
#getwd()
df <- read.csv("C575.csv")
df <- df %>% select(!Year)  # delete year column
names(df)[1] <- "G"
names(df)[2] <- "RV"
names(df)[3] <- "LV"
names(df)[4] <- "LD"
names(df)[5] <- "RD"

#summary(df)

sdf <- stack(df)
names(sdf)[1] <- "Grades"
names(sdf)[2] <- "Locations"

#summary(sdf)
adf <- aov(Grades~Locations, data=sdf)
summary(adf)
hist(adf$residuals)
#qqPlot(adf$residuals, id=FALSE, conf)

