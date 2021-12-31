#==========================
#                         |
#        Box Plot         |
#                         |
#==========================

# 12/31/2021

library(ggplot2)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
getwd()

df <- read.csv("C575.csv")
df$C <- with(df, Q1+Q2+Q3+Q4)
df$GC <- with(df, C+G)
gc1 <- filter(df, (GC>0))


ggplot (stack(gc1[,2:6]), aes(x=ind, y=values)) +

  geom_boxplot( fill="lightblue", color="darkred", notch=FALSE) +
  labs(
    title="Jitter boxplot of gastric and colonic ulcers",
    x="location",
    y="ulcer score"
  ) +
  #geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
  geom_jitter(shape=16, size=1, height=1, width = .2, color="darkblue") +
  scale_y_continuous(limits = c(0, 4), oob = scales::squish) +
  stat_summary(fun.y=mean, geom="point", shape=18, size=7, stroke=1.5,color="white") 






