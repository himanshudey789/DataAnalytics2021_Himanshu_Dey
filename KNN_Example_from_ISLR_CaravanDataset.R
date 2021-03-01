library(ISLR)
library(class)
head(Caravan)
str(Caravan)
dim(Caravan)
summary(Caravan)
summary(Caravan$Purchase)
any(is.na(Caravan))

var(Caravan[,1]) # Variance of the 1st column is 165.0378
var(Caravan[,2]) # Variance of the 2nd column is 0.1647
var(Caravan[,3]) # Variance of the 3rd column is 0.6238

StandardizedCaravan <- scale(Caravan[,-86])

var(StandardizedCaravan[,1])
var(StandardizedCaravan[,2])
var(StandardizedCaravan[,3])

purchase <- Caravan[,86]
#purchase <-Caravan[,'Purchase']

# test set
test_index <- 1:1000
test_data <- StandardizedCaravan[test_index,]
test_purchase <- purchase[test_index]

# train set
train_data <- StandardizedCaravan[-test_index,]
train_purchase <- purchase[-test_index]

set.seed(101)
predicted_purchase <- knn(train_data,test_data,train_purchase, k = 10)
head(predicted_purchase)

missClassError <- mean(test_purchase != predicted_purchase)
print(missClassError)

predicted_purchase <- NULL
error_rate <- NULL

for (i in 1:20) {
  set.seed(101)
  predicted_purchase <- knn(train_data, test_data, train_purchase, k =i)
  error_rate[i] <- mean(test_purchase != predicted_purchase)
}

print(error_rate)

# Plot the K value on a graph
library(ggplot2)
k_values <- 1:20


error_df <- data.frame(error_rate, k_values)
print(error_df)
ggplot(error_df,aes(k_values,error_rate)) + geom_point() + geom_line(lty='dotted', color='blue')

