library(GGally)
library(plotly)

all.mammals.milk.1956$cluster <- as.factor(clustering$cluster)

p <- ggparcoord(data = all.mammals.milk.1956, columns = c(2:6), groupColumn = "cluster", scale = "std") + labs(x = "milk constituent", y = "value (in standard-deviation units)", title = "Clustering")
ggplotly(p)
