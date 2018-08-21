all_data_raw <- read.csv("D:/dev/fom/Thesis/data/structured/time_series_all.csv")

str(all_data)

START <- 2010
SCHLUSS <- 2018

all_data <- all_data_raw[which(all_data_raw$years >= START & all_data_raw$years <= SCHLUSS),]

#for(technology in unique(all_data[,"technology"])){

technology <- "ML"

rows_technology <- which(all_data[,"technology"] == technology)
teildatensatz <- all_data[rows_technology,]

par(ask = TRUE)
plot(x = teildatensatz[, "years"], y = teildatensatz[, "records"], main = technology, xlab = "Jahr", ylab = "Anzahl Publikationen", type = "n", ylim = c(-10, max(teildatensatz[, "records"])), xlim = c(min(teildatensatz[, "years"]), max(teildatensatz[, "years"])))
#text(x = unique(teildatensatz[, "years"]), y = -10, srt = 90, labels = unique(teildatensatz[, "years"]))
legendentext <- character(0)
zaehler_k <- 0
zaehler <- 0
for(k in unique(teildatensatz[, "search_engine"])){
  zaehler_k <- zaehler_k + 1
  zeilen_k <- which(teildatensatz[,"search_engine"] == k)
  teildatensatz_k <- teildatensatz[zeilen_k, ]
  legendentext <- c(legendentext, paste("Suchmaschine: ", k, sep = ""))
  #SORTIERUNG <- sort(teildatensatz_k[, "years"], index.return = TRUE)$ix
  for(h in unique(teildatensatz_k[, "publication"])){
    zaehler <- zaehler + 1
    zeilen_h <- which(teildatensatz_k[,"publication"] == h)
    teildatensatz_h <- teildatensatz_k[zeilen_h, ]
    
    #mod_lm <- lm(teildatensatz_h$records ~ teildatensatz_h$years) 
    #summary(mod_lm)
    
    if(nrow(teildatensatz_h) == 1){
      teildatensatz_h <- rbind(teildatensatz_h[1,], teildatensatz_h, teildatensatz_h[1,])
      teildatensatz_h[1,"years"] <- teildatensatz_h[1,"years"] - 0.2
      teildatensatz_h[3,"years"] <- teildatensatz_h[3,"years"] + 0.2
      points(x = teildatensatz_h[, "years"], y = teildatensatz_h[, "records"], type = "l", col = zaehler, lty = zaehler_k, lwd = zaehler_k)
      points(x = teildatensatz_h[2, "years"], y = teildatensatz_h[2, "records"], type = "p", col = zaehler, pch = ifelse(teildatensatz_h[2, "publication"] == "A", 20, 2), cex = ifelse(teildatensatz_h[2, "publication"] == "A", 1, 1.5))
    }else{
      points(x = teildatensatz_h[, "years"], y = teildatensatz_h[, "records"], type = "l", col = zaehler, lty = zaehler_k, lwd = zaehler_k)
      points(x = teildatensatz_h[, "years"], y = teildatensatz_h[, "records"], type = "p", col = zaehler, pch = ifelse(teildatensatz_h[, "publication"] == "A", 20, 2), cex = ifelse(teildatensatz_h[, "publication"] == "A", 1, 1.5))
    }
  }
  
  
}
legend("topleft", legend = legendentext, bty = "n", lwd = 1:length(legendentext), lty = 1:length(legendentext))
legend("topright", legend = c("A", "KB"), bty = "n", pch = c(20, 2))

#}





