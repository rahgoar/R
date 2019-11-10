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

# Ward's method
hc5 <- hclust(d, method = "ward.D2" )

# Cut tree into 4 groups (clusters);
sub_grp <- cutree(hc5, k = 4)

# Number of members in each cluster
table(sub_grp)
## sub_grp
##  1  2  3  4 
##  7 12 19 12
#cutree output to add the the cluster each observation belongs to to our original data;
USArrests %>%
  mutate(cluster = sub_grp) %>%
  head
##   Murder Assault UrbanPop Rape cluster
## 1   13.2     236       58 21.2       1
## 2   10.0     263       48 44.5       2
## 3    8.1     294       80 31.0       2
## 4    8.8     190       50 19.5       3
## 5    9.0     276       91 40.6       2
## 6    7.9     204       78 38.7       2
# Add borders to 4 clusters in dendrogram;
plot(hc5, cex = 0.6)
rect.hclust(hc5, k = 4, border = 2:5)

#Visualize on a 2D;
fviz_cluster(list(data = df, cluster = sub_grp))

