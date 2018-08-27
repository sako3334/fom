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

ss <- subset(all_data, all_data$search_engine == 'WOS' & all_data$publication == 'A' & all_data$technology != 'ML')

x <- all_data[all_data$search_engine == 'WOS' & all_data$publication == 'A',]

sum(all_data[all_data$technology == 'ML',]$records)

attach(x)
names(x)
class(x)

glm(years~records,family = poisson)

table(x$technology)

aggregate(records~technology,x,sum)

tapply(all_data$records,all_data$technology, sum)

pie(aggregate(records ~ technology, x, sum)$records,labels = technology,)

ts.plot(years,records)

plot(years,records,col=1)

all_data[sum(all_data$records)]

abline(lm(records~years))
lines(years,records)

summary(ss)
View(ss)


ggplot(ss, aes(x=years,y=records)) + 
  geom_line(aes(color = technology), size = 1) +
  scale_color_manual(values = c(1:11)) +
  theme_minimal()

ggplot(all_data, aes(x = years, y = records)) + 
  geom_line(aes(color = technology), size = 1) +
  scale_color_manual(values = c(1:11)) +
  theme_minimal()

ggplot(data = all_data,  aes(x=years, y=records) )   +   # store it
  ylab('Anzahl Publikationen')             +
  geom_line(col="blue")                      +
  geom_point(col="blue", pch=1)

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
