# Coursera Data Sciente Track
# Course 3: Getting and Cleaning Data
# Course Project

# set working directory
setwd("~/Documents/data/coursera/projectC3")

# download and unzip data into working directory
# list files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Dataset.zip",method="curl")
unzip(zipfile="./Dataset.zip",exdir=".")
path_rf <- file.path("." , "UCI HAR Dataset")
files <- list.files(path_rf, recursive=TRUE)
files

# course project part 1
# Merge the training and test sets to create one data set

# read some tables
xtrain    <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain    <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest     <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest     <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjtest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# the merge
xdata    <- rbind(xtrain, xtest)
ydata    <- rbind(ytrain, ytest)
subjdata <- rbind(subjtrain, subjtest)


# course project part 2
# Extract only the measurements on the mean and standard deviation for each measurement

# read the "features" dataset
features <- read.table("./UCI HAR Dataset/features.txt")

# use "grep" to find "means" and "stds"
keyfeatures <- grep("-(mean|std)\\(\\)", features[, 2])

# subset columns of interest and append the new column names
xdata <- xdata[, keyfeatures]
names(xdata) <- features[keyfeatures, 2]


# course project part 3
# Use descriptive activity names to name the activities in the data set

# read the "activities" dataset
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# subset columns of interest and append the new column names
ydata[, 1] <- activities[ydata[, 1], 2]
names(ydata) <- "activity"


# course project part 4
# Appropriately label the data set with descriptive variable names

# label for subjdata
names(subjdata) <- "subject"

# combine each of the datasets
alldata <- cbind(xdata, ydata, subjdata)


# course project part 5
# From the data set in step 4, creates a second, 
# independent tidy data set with the average of 
# each variable for each activity and each subject

library(plyr)

# get average of each variable and write to tidy dataset
AveragesData <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(AveragesData, "./AveragesData.txt", row.name=FALSE)


