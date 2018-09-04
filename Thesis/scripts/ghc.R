ghc_trend <- read.csv("D:/dev/fom/Thesis/data/structured/ghc_trend.csv")

plot(xaxt='n', yaxt='n', x = ghc_trend[, "year"], y = ghc_trend[, "trend"], xlab = "Veroeffentlichungsjahr", ylab = "Trendstaerke", type = "n", ylim = c(0,100), xlim = c(2010,2019))
axis(side = 1, xaxp=c(2010, 2018, 8))
axis(side = 2, yaxp=c(0, 100, 10))
grid()

sym <- rep(c(21,22,24),c(4,4,3))
bcol <- c(c(2:4,8),c(2:4,8),2:4)

i <- 1
legend_text <- character(0)

for(t in unique(ghc_trend[, "technology"])){
  rows <- which(ghc_trend[,"technology"] == t)
  technologies <- ghc_trend[rows,]

  lines(x = technologies[, "year"], y = technologies[, "trend"], type = "l", col = 'gray')
  points(x = technologies[, "year"], y = technologies[, "trend"], col = 1, pch = sym[i], bg=bcol[i])
  
  legend_text <- c(legend_text, paste(t, sep = ""))
  i <- i+1
}

legend("topright", legend = legend_text, bty = "n", pch = sym, pt.bg = bcol)