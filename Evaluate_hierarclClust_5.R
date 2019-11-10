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

#To perform the elbow method;
fviz_nbclust(df, FUN = hcut, method = "wss")

#perform the average silhouette
fviz_nbclust(df, FUN = hcut, method = "silhouette")

#Gap statistic method;
gap_stat <- clusGap(df, FUN = hcut, nstart = 25, K.max = 10, B = 50)
fviz_gap_stat(gap_stat)
