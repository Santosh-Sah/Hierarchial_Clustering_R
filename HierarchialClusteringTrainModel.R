source("HierarchialClusteringUtils.R")

#reading dataset 
hierarchialClusteringDataset = importHierarchialClusteringDataset("Hierarchial_Clustering_Mall_Customers.csv")

set.seed(1234)

# Fitting HierarchialClustering to dataset
#With the dendogram method we have figured out the total number of cluster is 5
hierarchialClustering = hclust(d = dist(hierarchialClusteringDataset, method = 'euclidean'), method = 'ward.D')

#saving HierarchialClustering model
saveHierarchialClusteringModel(hierarchialClustering)
