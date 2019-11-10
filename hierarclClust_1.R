#https://uc-r.github.io/hc_clustering

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

#Statistics arrests in 100,000 residents in 50 US states in 1973;
df <- USArrests
#Remove or estimate missing values;
df <- na.omit(df)
#Standardize data to be comparable: mean zero and standard deviation one;
df <- scale(df)
head(df)

# Dissimilarity matrix
d <- dist(df, method = "euclidean")

#agglomeration method to be used (i.e. “complete”, “average”, “single”, “ward.D”)
# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )

# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)
