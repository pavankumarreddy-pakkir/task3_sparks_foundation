rm(list=ls())
#--------------------------------------------------------loading the dataset
setwd("D:/Coursera/sparks/task3")
iris<-read.csv("Iris.csv")
iris.special=iris
#--------------------------------------------------------finding the number of clusters
iris.special$Species<-NULL
length(unique(iris$Species))
wss<-0
for(i in 1:10){
  km<-kmeans(iris.special,centers=i,nstart=20)
  wss[i]<-km$tot.withinss
}
km
plot(1:10,wss,type="b",
     xlab="Number of Clusters",
     ylab="WSS")
#--from the graph we can observe that the elbow is at 3
#-------------------------------------------------------Showing the cluster plot
results<-kmeans(iris.special,3)
results
results$cluster
table(iris$Species,results$cluster)
plot(iris[c("PetalLengthCm","PetalWidthCm")], col=results$cluster)
points(results$centers[,c("PetalLengthCm","PetalWidthCm")],col=1:8,pch=8, cex=2)

plot(iris[c("SepalLengthCm","SepalWidthCm")], col=results$cluster)
points(results$centers[,c("SepalLengthCm","SepalWidthCm")],col=1:8,pch=8, cex=2)
#--hence, the centroids are also displayed 
