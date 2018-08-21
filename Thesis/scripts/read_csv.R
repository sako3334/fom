library(ggplot2)
library(TTR)
library(mosaic)
library(readr)
all_data <- read.csv("D:/dev/fom/Thesis/data/structured/time_series_all.csv")
wos_av_art <- read.csv("D:/dev/fom/Thesis/data/structured/wos/wos_autonomous_vehicles_art_ts.csv")
wos_av_proc <- read.csv("D:/dev/fom/Thesis/data/structured/wos/wos_autonomous_vehicles_proc_ts.csv")
ieee_av_art <- read.csv("D:/dev/fom/Thesis/data/structured/ieee/ieee_autonomous_vehicles_art_ts.csv")
ieee_av_proc <- read.csv("D:/dev/fom/Thesis/data/structured/ieee/ieee_autonomous_vehicles_proc_ts.csv")
acm_av_art <- read.csv("D:/dev/fom/Thesis/data/structured/acm/acm_autonomous_vehicles_art_ts.csv")
acm_av_proc <- read.csv("D:/dev/fom/Thesis/data/structured/acm/acm_autonomous_vehicles_proc_ts.csv")

plot(all_data)

ggplot(all_data, aes(x = years, y = count)) + 
  geom_line(aes(color = technology), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800","#00AFBB", "#E7B800","#00AFBB", "#E7B800","#00AFBB", "#E7B800","#00AFBB", "#E7B800","#00AFBB")) +
  theme_minimal()

cor(wos_conf~wos_art,data = all_data)
lm(wos_conf~wos_art,data = all_data)
xyplot(wos_conf~wos_art,data = all_data)

histogram(years~wos_conf,data=all_data)

inspect(all_data)

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
