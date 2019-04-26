#simple linear regesion

#import dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[,2:3]

#split dataset into test and train
#install package ('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$YearsExperience, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#fitting simple linear regression to training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#predicting the test set results
y_pred = predict(regressor, newdata = test_set)

#visualising the traing set results
#install.packages('ggplot2')

library(ggplot2)


ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set))
  , colour = 'purple')
