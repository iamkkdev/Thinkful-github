
library(MASS)
library(ggplot2)
library(tidyr)

dir_name = "/Users/krishnadevabhaktuni/Desktop"
file_name_pd = 'R.csv'
file_name_cov = 'R2.tab'

# as.is controls the conversion of columns
# the default behavior of read.table is to convert character variables to 
#factors

#importing the data
data_pd = read.table('R.csv', header = T, sep = ',', as.is = F)
head(data_pd)
data_cov = read.table('R2.tab', header = T, sep = '\t', as.is = F)
head(data_cov)
# head function returns first 6 rows of data

str(data_pd)
str(data_cov)

#str function returns number of rows, columns and type of variables
#data_cov has 300 obs and 7 variables
#chr refers to categorical variable

?make.names
# If your header contains labels that are not syntactically valid then 
# make.names() will replace them with a valid name, based upon the invalid 
# name, removing invalid characters and possibly prepending X:
?names
names(data_pd)[1] = 'ID'
names(data_pd)

#When we uncheck the tidyr package it does not work because tidyr package is 
#not loaded 

?gather()
?tidyr::gather
tidy_pd = gather(data = data_pd, key = 'TIME', value = 'CD4')
head(tidy_pd)
# If we don't exclude 'ID' TIME column contains ID
tidy_pd = gather(data = data_pd, key = 'TIME', value = 'CD4', -ID)
head(tidy_pd,5)
nrow(tidy_pd)
ncol(tidy_pd)
summary(tidy_pd)

# didn't get the mean and median, converting the variables to numeric
tidy_pd$CD4 = as.numeric(tidy_pd$CD4)
# when we do as.numeric we get 'NAs introduced by coercion' because 
#CD4 is float

tidy_pd$time1 = as.numeric(tidy_pd$TIME) 
#When we try to the conversion without removing characters, we will get a 
#warning 'NA's introduced by coercion, so we have to remove chars first'
tidy_pd$TIME = gsub('day.', '', tidy_pd$TIME)
tidy_pd$TIME

#Now converting the variable into a numeric variable
tidy_pd$TIME = as.numeric(tidy_pd$TIME)
tidy_pd$TIME

#Creating new variable height in metres and BMI
data_cov$HT_in_m = data_cov$HT/100
data_cov$BMI = round(data_cov$WT/data_cov$HT_in_m ^ 2,1)

#Creating new variable cbmi and assigning to NA
attach(data_cov)

if (BMI >25| BMI == 25){
      print(CBMI = 3)
}

