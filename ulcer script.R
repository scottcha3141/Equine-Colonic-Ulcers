library("MASS")
library(dplyr)
library(ggplot2)
library(scales)

setwd("C:/Users/scott/OneDrive/Documents/Freedom Health/studies/meta-analysis/")
getwd()

df <- read.csv("C575.csv")

g1 <- filter(df, G>0)


ggplot (g1, aes(G)) +

  geom_histogram(aes(y = (..count..)/sum(..count..)),
    breaks=seq(.5, 4.5, by=1),
    col="black", fill="coral") +
    
  scale_fill_gradient(low="red", high="darkred") + 
  
  geom_text(aes(y = ((..count..)/sum(..count..)), 
    label = scales::percent((..count..)/sum(..count..))), 
    stat = "count", 
    vjust = -0.25) +
  
  scale_y_continuous(labels = percent) +
  
  labs(title=paste0("Histogram of Horses with Gastric Ulcers (N=", nrow(g1), ")"),
    x="Ulcer Score",
    y="Percent" ) +
  
  stat_function(fun = dnorm, args = list(mean = mean(g1$G), sd = sd(g1$G))) +
  
  geom_vline(xintercept=mean(g1$G), linetype="dashed", color = "black") +
  
  geom_text(x=3.5, y=.4, label=paste0("mean=",format(mean(g1$G), digits=2)))

# x<-seq(0,+4,by=0.02)
# curve(dnorm(x), add=TRUE)
