all_data_raw <- read.csv("D:/dev/fom/Thesis/data/structured/time_series_all.csv")

str(all_data_raw)

START <- 2010
SCHLUSS <- 2018

all_data <- all_data_raw[which(all_data_raw$years >= START & all_data_raw$years <= SCHLUSS),]

t <- 1
for(technology in unique(all_data[,"technology"])){
#  technology <- "ML"

  rows_technology <- which(all_data[,"technology"] == technology)
  technologies <- all_data[rows_technology,]
  
  par(ask = TRUE)
  plot(x = technologies[,"years"], y = technologies[,"records"], main = technology, xlab = "Veröffentlichungsjahr", ylab = "Anzahl Publikationen", type = "n", ylim = c(min(technologies[,"records"]), max(technologies[,"records"])+max(teildatensatz[, "records"])/10), xlim = c(min(technologies[,"years"]), max(technologies[,"years"])))
  #text(x = unique(technologies[,"years"]), y = -10, srt = 90, labels = unique(technologies[,"years"]))
  legendentext <- character(0)
  s <- 1
  for(search_engine in unique(technologies[,"search_engine"])){
    rows_search <- which(technologies[,"search_engine"] == search_engine)
    search_engines <- technologies[rows_search,]
    legendentext <- c(legendentext, paste(search_engine, sep = ""))
    #SORTIERUNG <- sort(search_engines[, "years"], index.return = TRUE)$ix
    for(p in unique(search_engines[,"publication"])){
      rows_pub <- which(search_engines[,"publication"] == p)
      publications <- search_engines[rows_pub,]
      
      #mod_lm <- lm(publications$records ~ publications$years) 
      #summary(mod_lm)
      
      if(nrow(publications) == 1){
        publications <- rbind(publications[1,], publications, publications[1,])
        publications[1,"years"] <- publications[1,"years"] - 0.2
        publications[3,"years"] <- publications[3,"years"] + 0.2
        points(x = publications[,"years"], y = publications[,"records"], type = "l", col = t, lty = s, lwd = s)
        points(x = publications[2,"years"], y = publications[2,"records"], type = "p", col = t, pch = ifelse(publications[2,"publication"] == "A", 20, 2), cex = ifelse(publications[2,"publication"] == "A", 1, 1.5))
      }else{
        points(x = publications[,"years"], y = publications[,"records"], type = "l", col = t, lty = s, lwd = s)
        points(x = publications[,"years"], y = publications[,"records"], type = "p", col = t, pch = ifelse(publications[,"publication"] == "A", 20, 2), cex = ifelse(publications[,"publication"] == "A", 1, 1.5))
      }
    }
    s <- s + 1
  }
  legend("topleft", legend = legendentext, bty = "n", lwd = 1:length(legendentext), lty = 1:length(legendentext))
  legend("topright", legend = c("A", "KB"), bty = "n", pch = c(20, 2))
  t <- t + 1
}