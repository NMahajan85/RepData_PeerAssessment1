##Data Set Information:
=================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 

##Feature Selection 
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

##Work Performed on the original data set to get tidy data set
=================
*The data from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
was downloaded and the folder containing the data was set as the working directory for the project.

*The README.txt file provided much of the insight to the data contained in different files.

*The training data set X_train.txt and its labels (i.e. 1, 2, 3, 4, 5, 6) y_train.txt files were read into R from the train folder.

*Then subject_train.txt was read into R. It had information about the subject a number between 1 - 30 who volunteered for project. 

*Similarly, the test data set X_test.txt, its labels y_test.txt and subject_test.txt were read into R.

*Next, the features.txt file was read into R as a table. The second column contained names of all the variable (561 features).
These names were assigned to train and test data set previously read into R.

*Using cbind subjects and labels were bound to test and train data set.

*Then to obtain a single data set test and train data sets were combined using rbind function.

*grep function with arguments value = FALSE and fixed = TRUE was used to extract exact match for "-mean()" and "-std()" to obtain 
measurements on mean and standard deviation of each measurement. By using argument fixed = TRUE features like "meanFreq()" were not
selected and hence not found in final data set.

*At tis point to add descriptive names of the activities to the data set, the activity_labels.txt file was read into R as table. Its 
columns were named as Activity and Activity_name. A new variable with name Activity_Name and as a factor was created in the data set
based on last column of data set from previous step as it corresponded to the activity number. Then after forcing Activity_name into 
character, it was passed on to newly created factor variable Activity_Name in the data set to get data_final.

*To create tidy data set reshape package was loaded into the workspace. Using the melt function data frame data_final was melted and 
Subject, Activity and Activity_Name were used as id.vars. By omitting measure.vars value it was implied to treat all the remaining columns
as variables. The data set was casted using cast function and passing Subject + Activity_Name ~ varaible as the formula and mean as fun.
This gave a 180 X 68 dimensioned data set. 30 subjects, with each performing 6 activities. This data set provided the average of each variable 
for each activity and each subject.

*Finaly using write.table tidy_data.txt was created.



















