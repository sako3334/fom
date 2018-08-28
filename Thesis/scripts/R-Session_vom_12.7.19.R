library(mosaic)                  # nach jedem Start als ersten Befehl
inspect(tips)                    # eine erste Übersicht über den Datensatz
favstats (~total_bill,data=tips) # favstats = Lieblingsstatistik
tally (~sex,data=tips)              # Anteile
tally (~sex,"proportion",data=tips) # Anteile in %
tally (sex~smoker,data=tips) # Anteile
tally (smoker~sex,"percent",data=tips) # Kreuztabelle: Raucherquote nach Geschlecht
cor (tip~total_bill, data=tips) # Korrelation: je höher die Rechnung, desto höher das Trinkgeld
lm (tip~total_bill, data=tips) # Regression: wie liegt die Linie? y= b * x + intercept
lm (tip~total_bill+size, data=tips) # multiple Regression
# Trinkgeld = ,09 * Rechnung + ,19 * size + ,66
mean(tip~sex, data= tips) # Wer gibt mehr Trinkgeld: Männer oder Frauen ?
favstats(tip~sex, data= tips) # Wer gibt mehr Trinkgeld: Männer oder Frauen
library(gplots) # ist nötig für plotmeans
gplots::plotmeans(tip~day, data=tips)
tips$tip_proz <- tips$tip / tips$total_bill *100 # % Trinkgeld berechnen (tip_proz)
cor(tip_proz~total_bill, data=tips) # je höher die Rechnung, desto niedriger das prozentuale Trinkgeld