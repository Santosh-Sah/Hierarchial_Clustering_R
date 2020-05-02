source("HierarchialClusteringUtils.R")
library(ggplot2)
library(cluster)

#reading dataset 
hierarchialClusteringDataset = importHierarchialClusteringDataset("Hierarchial_Clustering_Mall_Customers.csv")


#reading HierarchialClustering model
hierarchialClusteringModel = readRDS("HierarchialClusteringModel.RDS")

#Using the dendogram method to find the optimal number of clusters
hierarchialClusteringDendogramMethod <- function(hierarchialClusteringDataset){
  
  hierarchialClusteringDendogram = hclust(d = dist(hierarchialClusteringDataset, method = 'euclidean'), method = 'ward.D')
  
  png("HierarchialClusteringDendogram.png")
  plot(hierarchialClusteringDendogram,
       main = paste("Dendogram"),
       xlab = "Customers",
       ylab = "Euclidean distances")
  
  dev.off()
  
}

#visualizing cluster
#if your dataset has multiple dimension then please do not run this plot. This plot is only for two dimensional data only.
#if your dataset has multiple dimension and still you want to draw this plot then we need to create two dimension with the help of PCA.
hierarchialClusteringClusters <- function(hierarchialClusteringDataset, hierarchialClusteringModel){
  
  y_hc = cutree(hierarchialClusteringModel, 5)
  
  png("HierarchialClusteringClusters.png")
  
  clusplot(hierarchialClusteringDataset,
           y_hc,
           lines = 0,
           shade = TRUE,
           color = TRUE,
           labels= 2,
           plotchar = FALSE,
           span = TRUE,
           main = paste('Clusters of customers'),
           xlab = 'Annual Income',
           ylab = 'Spending Score')
  
  dev.off()
  
}

#hierarchialClusteringDendogramMethod(hierarchialClusteringDataset)
hierarchialClusteringClusters(hierarchialClusteringDataset, hierarchialClusteringModel)
