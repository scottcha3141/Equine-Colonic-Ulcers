#==========================
#                         |
#   Jitter Bar Chart      |
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
#df$C <- with(df, Q1+Q2+Q3+Q4)
#df$GC <- with(df, C+G)
#gc1 <- filter(df, (GC>0))

names(df)[2] <- "RVC"
names(df)[3] <- "LVC"
names(df)[4] <- "LDC"
names(df)[5] <- "RDC"

df <- df %>% select(!Year)

ggplot (stack(df), aes(x=ind, y=values)) +
  labs(
    title="Mean gastric and colonic ulcer scores for all horses",
    x="location",
    y="mean ulcer score"
  ) +
  theme_bw() + theme(legend.position = "none") +
  scale_fill_manual(values = c("#ff4444", "#ffcccc", "#ffaaaa", "#ff8888", "#ff6666"))+
  geom_bar(stat="summary", aes(fill=ind), color = "black") +
  geom_jitter(shape=16, size=1, height=1, width = .25, color = "red4") + 
  scale_y_continuous(limits = c(0, 4), oob = scales::squish) 
  #stat_summary(fun.data = mean_se, geom = "errorbar", width=0.2) +
  #stat_summary(aes(label = round(..y..,2)), geom="text", vjust = 3) 






