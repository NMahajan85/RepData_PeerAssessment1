##1. Reading Training data set and training labels into R 
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = F)
dim(data_train)

data_train_label <- read.table("./UCI HAR Dataset/train/y_train.txt", header = F)
dim(data_train_label)
names(data_train_label) <- c("Activity")

##2. Reading subject who performed the tarining activity for each window sample
data_sub.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = F)
dim(data_sub.train)
names(data_sub.train) <- c("Subject")

##3. Reading Test data set and testing labels into R
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = F)
dim(data_test)

data_test_label <- read.table("./UCI HAR Dataset/test/y_test.txt", header = F)
dim(data_test_label)
names(data_test_label) <- c("Activity")

##4. Reading subject who performed the testing activity for each window sample
data_sub.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = F)
dim(data_sub.test)
names(data_sub.test) <- c("Subject")

##5. Reading features data set into R to extract the names of features
features <- read.table("./UCI HAR Dataset/features.txt", header = F)
nrow(features)
dim(features)
head(features, n=10)

##6. Assigning names of the features to test and train data sets
names(data_train) <- features[,2]
names(data_test) <- features[,2]

##7. Binding subjects and labels with train and test data sets
data_train_1 <-  cbind(data_train, data_sub.train, data_train_label)
dim(data_train_1)
head(data_train_1, n= 1)

data_test_1 <-  cbind(data_test, data_sub.test, data_test_label)
dim(data_test_1)
head(data_test_1, n= 1)

##8. Combining test and train data sets to get a single data set
data <- rbind(data_train_1, data_test_1)
nrow(data)
ncol(data)
data[1:20, 560:563]


##9. Subsetting data set to get measurements on the
## mean and standard deviation for each measurement
x <- features[,2]  ## extracting names of all the features
y <- grep("-mean()",x, value = F, fixed = T) ##extracting measurements on mean of each measurement
y
z <- grep("-std()", x, value = F, fixed = T) ##extracting measurements on standard deviation of each measurement
z
mean_std <- c(y, z, 562, 563)## 562 column has subject # and 563 has activity label
mean_std
data_final <- data[,mean_std]
dim(data_final)
names(data_final)

##10. Adding descriptive names of the activities
activity_nm <- read.table("./UCI HAR Dataset/activity_labels.txt", header = F)
names(activity_nm) <- c("Activity","Activity_name")

data_final$Activity_Name <- as.factor(data_final[,68])
levels(data_final$Activity_Name) <- as.character(activity_nm[,2])
length(data_final$Activity_Name)
names(data_final)
data_final[1:200, 66:69]

##11. Creating tidy data set from data_final data set as per project requirements
library(reshape)
data_molten <- melt(data_final, id.vars = c("Subject","Activity","Activity_Name"))
tidy_data <- cast(data_molten, Subject + Activity_Name ~ variable, mean)
## tidy_data is the final data set
dim(tidy_data)

## 12. Writing tidy data in a table
write.table(tidy_data, file = "./tidy_data.txt")
data <- read.table("./tidy_data.txt", header = T)


