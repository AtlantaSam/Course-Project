
## The Codebook for Course Project Dataset AveragesData.txt

This document includes a description of the variables, the data and transformations performed in the process of downloading, merging, cleaning data that is ultimately processed as a tidy dataset called AveragesData.txt.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was sourced from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A script was created that was called run_analysis.R, and performed the following tasks:
* Merged the training and the test sets to create one data set.
* Extracted only the measurements on the mean and standard deviation for each measurement. 
* Used descriptive activity names to name the activities in the data set
* Appropriately labeled the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Summary of what run_analysis.R actually did:

•	Data was merged using the rbind() function.
•	The columns with the mean and standard deviation measures were taken from the merged dataset. After columns were extracted, they are given the correct names, taken from features.txt.
•	Activity data is addressed with values 1:6; Activity names and IDs are taken from activity_labels.txt and are substituted in the dataset.
•	Columns with vague column names are corrected and a new dataset with all the averages and standard deviations is generated






The actual dataset consists of the following fields;

Field 1 is called “Subject” and it consists of the following data: 1,2,3,4,5,6

Field 2 id called “Activity” and it consists of the following data: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

Fields 3-68 represents averages and standard deviations relative to each combination of Subject and Activity. Each average and standard deviation is relative to each of the following categories:

•	tBodyAcc
•	tGravityAcc
•	tBodyAccJerk
•	tBodyGyro
•	tBodyGyroJerk
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc
•	fBodyAccJerk
•	fBodyGyro
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag
