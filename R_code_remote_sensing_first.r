# Il mio primo codice in R per il telerilevamento
# setwd("C:/lab/") # Windows
#install.packages("raster")
library(raster)
# la funzione library richiama il pacchetto che abbiamo installato su R
setwd("C:/lab/")
# con la funzione setwd spieghiamo ad R dove andare a pescare i dati
# i dati sono all'interno della cartella lab
# la cartella lab deve essere creata nell'unità :C e non sul desktop 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
# la funzione brick serve a importare tutto il pacchetto dell'immagine satellitare
# posso associare la funzione brick ad un certo oggetto 
# il file "p224r63_2011_masked.grd" viene associato a p224r63_2011
p224r63_2011
# informazioni dirette sul file come la sua classe, la sua risoluzione o la sua dimensione ecc.
plot(p224r63_2011)
# la funzione plot plotta in R il file selezionato
# Immagini analizzate nelle bande dal blu all'infrarosso termico (da B1 a B6)
# B7 banda dell'infrarosso medio come B5 
cl <-colorRampPalette(c("black", "grey", "light grey")) (100)
# cambio colori
# (100) definisce il numero dei livelli dei colori 
# la funzione colorRampPalette permette di stabilire la nuova scala di colori
# associo la funzione all'elemento "cl"
plot(p224r63_2011, col=cl)
# "col" è un argomento della funzione plot che serve a stabilire i colori
# color change new
cl <-colorRampPalette(c("blue", "green", "red", "yellow", "white")) (100)
plot(p224r63_2011, col=cl)


