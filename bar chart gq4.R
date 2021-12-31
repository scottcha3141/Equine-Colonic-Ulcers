#==========================
#                         |
#        Bar Chart        |
#                         |
#==========================

# 12/31/2021

library(ggplot2)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
getwd()

df <- read.csv("C575.csv")
#df$C <- with(df, Q1+Q2+Q3+Q4)
#df$GC <- with(df, C+G)
#gc1 <- filter(df, (GC>0))
df <- df %>% select(!Year)

ggplot (stack(df), aes(x=ind, y=values)) +
  labs(
    title="Mean gastric and colonic ulcer scores",
    x="location",
    y="mean ulcer score"
  ) +
  geom_bar(stat="summary", aes(fill=ind), color = "black") +
  #geom_jitter(shape=16, height=0, width = 0.2) + 
  stat_summary(fun.data = mean_se, geom = "errorbar", width=0.2) +
  #geom_text(aes(label = mean_se, vjust = -0.2) +
  scale_fill_manual(values = c("#ff4444", "#ffcccc", "#ffaaaa", "#ff8888", "#ff6666"))+
  theme_bw() + theme(legend.position = "none")





