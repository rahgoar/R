create_train_test <- function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample < -  data[total_row]
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
}

# function brings back a test set if train argument is false;

create_train_test(df, size = 0.8, train = TRUE)
data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)


n = nrow(clean_titanic)
trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
train_set = clean_titanic[trainIndex ,]
test_set = clean_titanic[-trainIndex ,]


prop.table(table(train_set$survived))
prop.table(table(test_set$survived))
