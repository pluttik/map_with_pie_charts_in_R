#some super simple code to make a graph containing a map with pie charts
#you will need to change the path for infile.csv
infile<-read.csv("C:/programs/r/map_with_pie_charts/map_with_pie_charts_in_R/infile.csv")
head(infile)

#using maps, mapdata and mapplots
#you may need to install these packages first
library(maps)
library(mapdata)
library(mapplots)

map("worldHires",c("UK","Netherlands","Belgium","France","Denmark","Germany","Luxembourg"),
                   xlim=c(-3,10), ylim=c(50,58), col="gray90", fill=TRUE,lwd=0.5)

#here is how to change the position of a particular pie chart to remove overlap
infile[9,2] <- infile[9,2]-.1

#for loop through the points
#zdata is going to contain the vector with the data for the pie diagram
#change the length of zdata if you have fewer or more than 3 classes as in this example
n_locations<-nlevels(infile$location)
for(location in c(1:n_locations)) {
  zdata<-c(infile[location,4],infile[location,5],infile[location,6])
  add.pie(z=zdata, x=infile[location,"lon"], y=infile[location,"lat"], 
          radius=0.16, col=c("orange","red","blue"), labels="",lwd=0.5)
}

#see here how to add labels to the legend
text(1.1, 57.9, labels =substitute(paste(italic("one"))))
text(0, 57.35, labels =substitute(paste(italic("two"))))
text(-1.3, 57.9, labels =substitute(paste(italic("three"))))
