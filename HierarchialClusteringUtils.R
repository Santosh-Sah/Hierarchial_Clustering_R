importHierarchialClusteringDataset <- function(hierarchialClusteringDatasetFileName) {
  
  #importing dataset
  hierarchialClusteringDataset = read.csv(hierarchialClusteringDatasetFileName)
  
  #getting the required columns
  hierarchialClusteringDataset = hierarchialClusteringDataset[4:5]
  
  return (hierarchialClusteringDataset)
  
}

#Save HierarchialClustering Model
saveHierarchialClusteringModel <- function(hierarchialClusteringModel) {
  
  saveRDS(hierarchialClusteringModel, file = "HierarchialClusteringModel.RDS")
}

#predict new
hierarchialClusteringPredictNewClusters <- function(newDataSet, centers) {
  # compute squared euclidean distance from each sample to each cluster center
  tmp <- sapply(seq_len(nrow(newDataSet)),
                function(i) apply(centers, 1,
                                  function(v) sum((newDataSet[i, ]-v)^2)))
  max.col(-t(tmp))  # find index of min distance
}
