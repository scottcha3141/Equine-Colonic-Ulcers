library("MASS")
library(dplyr)
library(ggplot2)
library(scales)
library(gridExtra)
library(cowplot)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
getwd()

df <- read.csv("C575.csv")
df$C <- with(df, Q1+Q2+Q3+Q4)
#df$GC <- with(df, C+G)
c1 <- filter(df, (C>0))

fillcolors <- c("pink", rep("coral",3))

Q1Plot <- ggplot (c1, aes(Q1)) +
  geom_histogram(aes(y = (..count..)/sum(..count..)),
    breaks=seq(-.5, 3.5, by=1),
    col="black", fill=fillcolors) +
  coord_cartesian(xlim=c(-.5,4.5), ylim=c(0,.8)) +
  geom_text(aes(y = ((..count..)/sum(..count..)), 
    label = scales::percent((..count..)/sum(..count..))), 
    stat = "count", 
    vjust = -0.25) +
  scale_y_continuous(labels = percent) +
  labs(title=paste0("A. Right Ventral Colon (RVC)"),
    x="Ulcer Score",
    y="Percent" ) +
  stat_function(fun = dnorm, args = list(mean = mean(c1$Q1), sd = sd(c1$Q1))) +
  geom_vline(xintercept=mean(c1$Q1), linetype="dashed", color = "black") +
  geom_text(x=mean(c1$Q1)+1.3, y=.75, 
    label=paste0("mean=",format(mean(c1$Q1), digits=2),
                ", var=", format(sd(c1$Q1)^2, digits=2)))

Q2Plot <- ggplot (c1, aes(Q2)) +
  geom_histogram(aes(y = (..count..)/sum(..count..)),
                 breaks=seq(-.5, 3.5, by=1),
                 col="black", fill=fillcolors) +
  coord_cartesian(xlim=c(-.5,4.5), ylim=c(0,.8)) +
  geom_text(aes(y = ((..count..)/sum(..count..)), 
                label = scales::percent((..count..)/sum(..count..))), 
            stat = "count", 
            vjust = -0.25) +
  scale_y_continuous(labels = percent) +
  labs(title=paste0("B. Left Ventral Colon (LVC)"),
       x="Ulcer Score",
       y="Percent" ) +
  stat_function(fun = dnorm, args = list(mean = mean(c1$Q2), sd = sd(c1$Q2))) +
  geom_vline(xintercept=mean(c1$Q2), linetype="dashed", color = "black") +
  geom_text(x=mean(c1$Q2)+1.3, y=.75, 
            label=paste0("mean=",format(mean(c1$Q2), digits=2),
                         ", var=", format(sd(c1$Q2)^2, digits=2)))

Q3Plot <- ggplot (c1, aes(Q3)) +
  geom_histogram(aes(y = (..count..)/sum(..count..)),
                 breaks=seq(-.5, 3.5, by=1),
                 col="black", fill=fillcolors) +
  coord_cartesian(xlim=c(-.5,4.5), ylim=c(0,.8)) +
  geom_text(aes(y = ((..count..)/sum(..count..)), 
                label = scales::percent((..count..)/sum(..count..))), 
            stat = "count", 
            vjust = -0.25) +
  scale_y_continuous(labels = percent) +
  labs(title=paste0("C. Left Dorsal Colon (LDC)"),
       x="Ulcer Score",
       y="Percent" ) +
  stat_function(fun = dnorm, args = list(mean = mean(c1$Q3), sd = sd(c1$Q3))) +
  geom_vline(xintercept=mean(c1$Q3), linetype="dashed", color = "black") +
  geom_text(x=mean(c1$Q3)+1.3, y=.75, 
            label=paste0("mean=",format(mean(c1$Q3), digits=2),
                         ", var=", format(sd(c1$Q3)^2, digits=2)))

Q4Plot <- ggplot (c1, aes(Q4)) +
  geom_histogram(aes(y = (..count..)/sum(..count..)),
                 breaks=seq(-.5, 3.5, by=1),col="black",fill=fillcolors ) +
  coord_cartesian(xlim=c(-.5,4.5), ylim=c(0,.8)) +
  geom_text(aes(y = ((..count..)/sum(..count..)), 
                label = scales::percent((..count..)/sum(..count..))), 
            stat = "count", 
            vjust = -0.25) +
  scale_y_continuous(labels = percent) +
  labs(title=paste0("D. Right Dorsal Colon (RDC)"),
       x="Ulcer Score",
       y="Percent" ) +
  stat_function(fun = dnorm, args = list(mean = mean(c1$Q4), sd = sd(c1$Q4))) +
  geom_vline(xintercept=mean(c1$Q4), linetype="dashed", color = "black") +
  geom_text(x=mean(c1$Q4)+1.3, y=.75, 
            label=paste0("mean=",format(mean(c1$Q4), digits=2),
                         ", var=", format(sd(c1$Q4)^2, digits=2)))

grid.arrange(Q1Plot, Q2Plot, Q3Plot, Q4Plot, ncol=2)
