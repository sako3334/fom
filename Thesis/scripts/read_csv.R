library(readr)
ieee_autonomous_vehicles <- read_csv("D:/dev/fom/Thesis/data/ieee_autonomous_vehicles.csv")
#View(ieee_autonomous_vehicles)

library(mosaic)
library(readr)
wos_autonomous_vehicles <- read_delim("D:/dev/fom/Thesis/data/wos_autonomous_vehicles.txt", 
                                      "\t", escape_double = FALSE, trim_ws = TRUE)
#View(wos_autonomous_vehicles)

library(readr)
acm_autonomous_vehicles <- read_csv("D:/dev/fom/Thesis/data/acm_autonomous_vehicles.csv")
#View(acm_autonomous_vehicles)

