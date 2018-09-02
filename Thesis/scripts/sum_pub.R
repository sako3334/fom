pub_all <- read.csv("D:/dev/fom/Thesis/data/structured/time_series_all.csv")


pub_all <- pub_all[which(pub_all$years >= 2010 & pub_all$years <= 2017),]

plot(xaxt='n', yaxt='n', x = pub_all[, "years"], y = pub_all[, "records"], xlab = "Veröffentlichungsjahr", ylab = "Summe Publikationen", type = "n", xlim = c(2010,2019), ylim = c(1000,3000))
axis(side = 1, xaxp=c(2010, 2017, 7))
axis(side = 2, yaxp=c(1000, 3000, 10))
abline(h = c(20,100,500), col='gray', lty=2)
 
sym <- rep(c(21,22,24),c(4,4,3))
bcol <- c(c(2:4,8),c(2:4,8),2:4)
 
i <- 1
legend_text <- character(0)

for(t in unique(pub_all[, "technology"])){
#t="AV"
  rows <- which(pub_all[,"technology"] == t)
  technologies <- pub_all[rows,]
  
  ag <- aggregate(technologies$records, by=list(Year=technologies$years), FUN=sum)

  legend_text <- c(legend_text, paste(t, sep = ""))


  lines(x = ag[,"Year"], y = ag[,"x"], type = "l", col = 'gray60')
  points(x = ag[,"Year"], y = ag[,"x"], col = 1, pch = sym[i], bg=bcol[i])

  i <- i+1

}

legend("topright", legend = legend_text, bty = "n", pch = sym, pt.bg = bcol)