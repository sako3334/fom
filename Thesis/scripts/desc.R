all_data_raw <- read.csv("D:/dev/fom/Thesis/data/structured/time_series_all.csv")

str(all_data_raw)

START <- 2010
END <- 2017

all_data <- all_data_raw[which(all_data_raw$years >= START & all_data_raw$years <= END),]

for(technology in unique(all_data[,"technology"])){

  rows_technology <- which(all_data[,"technology"] == technology)
  technologies <- all_data[rows_technology,]
  
  par(ask = TRUE)
  plot(x = technologies[,"years"], y = technologies[,"records"], main = technology, xlab = "Veröffentlichungsjahr", ylab = "Anzahl Publikationen", type = "n", ylim = c(min(technologies[,"records"]), max(technologies[,"records"])+max(technologies[,"records"])/10), xlim = c(min(technologies[,"years"]), max(technologies[,"years"])))
  legend_text <- character(0)
  # grid()
  s <- 0
  p <- 0
  for(search_engine in unique(technologies[,"search_engine"])){
    s <- s + 1
    rows_search <- which(technologies[,"search_engine"] == search_engine)
    search_engines <- technologies[rows_search,]
    legend_text <- c(legend_text, paste(search_engine, sep = ""))
    for(publication in unique(search_engines[,"publication"])){
      p <- p + 1
      rows_pub <- which(search_engines[,"publication"] == publication)
      publications <- search_engines[rows_pub,]

      if(nrow(publications) == 1){
        publications <- rbind(publications[1,], publications, publications[1,])
        publications[1,"years"] <- publications[1,"years"] - 0.2
        publications[3,"years"] <- publications[3,"years"] + 0.2
        points(x = publications[,"years"], y = publications[,"records"], type = "l", col = p, lty = s)
        points(x = publications[2,"years"], y = publications[2,"records"], type = "p", col = p, pch = ifelse(publications[2,"publication"] == "A", 20, 2), cex = ifelse(publications[2,"publication"] == "A", 1, 1.5))
      }else{
        points(x = publications[,"years"], y = publications[,"records"], type = "l", col = p, lty = s)
        points(x = publications[,"years"], y = publications[,"records"], type = "p", col = p, pch = ifelse(publications[,"publication"] == "A", 20, 2), cex = ifelse(publications[,"publication"] == "A", 1, 1.5))
      }
    }
  }
  legend("topleft", legend = legend_text, bty = "n", lwd = 1:length(legend_text), lty = 1:length(legend_text))
  legend("topright", legend = c("A", "KB"), bty = "n", pch = c(20, 2))
}