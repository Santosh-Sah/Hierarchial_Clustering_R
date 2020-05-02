source("HierarchialClusteringUtils.R")
library(cluster)
library(class)

#Hierarchial clustering is not a supervised clustering. We can assign new observation to acluster with the help of hierarchial clustering.
#To put new obseration to a cluster we need to create knn model based the cluster which are created in the hierarchial clustering.
#Here with the help of knn I am trying to predict the cluster of a new observation.


#reading HierarchialClustering model
hierarchialClusteringModel = readRDS("HierarchialClusteringModel.RDS")

hierarchialClusteringDataset <- importHierarchialClusteringDataset("Hierarchial_Clustering_Mall_Customers.csv")

#here we can create a new datafram. For the simplicity I am using an observation from the dataset only.
inputValue = hierarchialClusteringDataset[100,]

#getting cluster from hierarchialClusteringModel
clusters = cutree(hierarchialClusteringModel, 5)


# predicting for new values
assignedCluster = knn(train = hierarchialClusteringDataset,
                                             test = inputValue,
                                             cl = clusters,
                                             k = 1)

assignedCluster



