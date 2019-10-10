library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = train_set, method = 'class')
rpart.plot(fit, extra = 101)


predict(fit, clean_titanic, type = 'class')

predict_unseen <-predict(fit, test_set, type = 'class')

table_mat <- table(test_set$survived, predict_unseen)
table_mat


accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))
