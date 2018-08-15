library(TTR)
library(mosaic)
library(readr)
wos_av_art <- read.csv("D:/dev/fom/Thesis/data/structured/wos_autonomous_vehicles_art_ts.csv")

plot(wos_av_art)
inspect(wos_av_art)

lm(years~records,data=wos_av_art)
cor(years~records,data = wos_av_art)

#boxplot(wos_av_art$records)
#xyplot(records~years,data = wos_av_art)

count<-ts(wos_av_art$records,start = 1982,end = 2018)

plot.ts(count)

av_wos <- SMA(count,n=3)
plot.ts(av_wos)
