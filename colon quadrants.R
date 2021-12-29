library("MASS")
library(dplyr)
library(ggplot2)
library(scales)
library(gridExtra)
library(cowplot)
library(tidyr)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")

df <- read.csv("C575.csv")
#df$C <- with(df, Q1+Q2+Q3+Q4)
#df$GC <- with(df, C+G)
#c1 <- filter(df, (C>0))
#cq <- df[3:6]

cq <- df %>%
  #select(Q1,Q2,Q3,Q4) %>%
  group_by (Q1) %>%
  summarize(Q1=n())

cQ1 = data.frame(table(df$Q1))
names(cQ1) <- c("Score", "Q1")
if (count(cQ1)<5) {
  newrow <- data.frame("Score"=as.factor(4), "Q1"=0)
  cQ1 <- rbind(cQ1,newrow)
}

cQ2 = data.frame(table(df$Q2))
names(cQ2) <- c("Score", "Q2")
if (count(cQ2)<5) {
  newrow <- data.frame("Score"=as.factor(4), "Q2"=0)
  cQ2 <- rbind(cQ2,newrow)
}

cQ3 = data.frame(table(df$Q3))
names(cQ3) <- c("Score", "Q3")
if (count(cQ3)<5) {
  newrow <- data.frame("Score"=as.factor(4), "Q3"=0)
  cQ3 <- rbind(cQ3,newrow)
}

cQ4 = data.frame(table(df$Q4))
names(cQ4) <- c("Score", "Q4")
if (count(cQ4)<5) {
  newrow <- data.frame("Score"=as.factor(4), "Q4"=0)
  cQ4 <- rbind(cQ4,newrow)
}

cQ <- cQ1
cQ$Q2 <- cQ2$Q2
cQ$Q3 <- cQ3$Q3
cQ$Q4 <- cQ4$Q4

#long_cQ <- cQ[1,2:5] %>% gather(Quadrant, Number)

long_cQ <- cQ %>% 
  pivot_longer(starts_with("Q"), 
               names_to = "Quadrant", 
               values_to = "Number")

color_palette = c("deeppink", "red3", "darkred", "black")

ggplot(long_cQ, aes(x=Quadrant, y=Number, group=Score, color = Score)) +
  geom_point(alpha=0.4) +
  geom_line(alpha=0.4, linetype="dashed") +
  scale_color_manual(values = color_palette) +
  geom_smooth(method = lm, se = FALSE) +
  theme_bw()
