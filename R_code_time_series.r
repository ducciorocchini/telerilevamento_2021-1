
#day 1
#time series analysis
#greenland increase in Temperature 
#Data and core from Emanuela Cosma
install.packages("raster")
library(raster)
setwd("C:/lab/greenland")

#day 2
install.packages("raster")
library(raster)
setwd("C:/lab/greenland")
#cartella greenland con 4 file,4 strati separati
#i file .tif rappresentano la stima della temperatura LST
# LST= land surface temperature
# LST da Copernicus (Global Land Service)
#la funzione brick non può essere utilizzata perchè i 4 file sono 4 file separati
# uso la funzione raster
# raster crea un rasterlayer
# uso la funzione raster per ogni file lst_x.tif
lst_2000<- raster("lst_2000.tif")
lst_2005<- raster("lst_2005.tif")
lst_2010<- raster("lst_2010.tif")
lst_2015<- raster("lst_2015.tif")
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
#list f files
# list.files crea la lista di file che R utilizzerà per la funzione lapply
# serve un path
# a noi il path non serve perchè abbiamo fatto la working directory
# serve un pattern
# pattern significa andare a cercare un certo tipo di file che ci interessa, es. i file .tif
# i file che ci interessano sono i file "lst"
rlist<- list.files(pattern="lst")
# la funzione lapply permette di applicare una funzione (es. raster) ad una lista di file (tipo quella dei file "lst")
# serve X ovvero la lista alla quale applicare la funzione
# serve FUN ovvero la funzione da applicare 
# X= rlist
# FUN= raster
# associo un nome all'oggetto ovvero "import"
import<- lapply(rlist,raster)
# la funzione stack permette di raggruppare un numero di file raster tutti assieme
# associo un nome all'oggetto ovvero "TGr"
TGr<- stack(import)
# così riesco a fare il plot dei file .tif in un attimo facendo il solo plot dell'ogggetto TGr appena creato
plot(TGr)
# utilizzo la funzione PlotRGB come nei casi studio precedenti
# scelgo uno stretch di tipo lineare
# scelgo le varie bande
plotRGB(TGr,1,2,3,stretch="Lin")
plotRGB(TGr,2,3,4,stretch="Lin")
plotRGB(TGr,4,3,2,stretch="Lin")

#day 3
library(raster)
library (rasterVis)
setwd("C:/lab/greenland")
lst_2000<- raster("lst_2000.tif")
> lst_2005<- raster("lst_2005.tif")
> lst_2010<- raster("lst_2010.tif")
> lst_2015<- raster("lst_2015.tif")
> rlist<- list.files(pattern="lst")
> import<- lapply(rlist,raster)
> TGr<- stack(import)
> TGr

levelplot(TGr)
levelplot(TGr$lst_2000)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

#melt list
meltlist<- list.files(pattern="melt")
melt<- lapply(meltlist,raster)
TMel<- stack(melt)
levelplot(TMel)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
melt_amount <- TMel$X2007annual_melt-TMel$X1979annual_melt
clb <-colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount,col=clb)

