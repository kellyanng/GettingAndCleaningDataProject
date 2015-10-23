library(dplyr)

#read in the data from the files
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# get the values and find the ones for "mean" and "std"
combinedData <- rbind(x_test, x_train)
colnames(combinedData) <- features[,2]
meanData <- combinedData[,grepl("mean", names(combinedData))]
stdData <- combinedData[,grepl("std", names(combinedData))]
combinedData <- cbind(meanData, stdData)

# get the activity IDs and give them a better name
activityIds <- rbind(y_test, y_train)
activityIds[,1] <- activityLabels[,2][activityIds[,1]]
colnames(activityIds) <- "ActivityId"

# get the subject IDS
subjectIds <- rbind(subject_test, subject_train)
colnames(subjectIds) <- "SubjectId"

# join the subject IDs, Activity Ids, and the actual data
combinedData <- cbind(subjectIds, activityIds, combinedData)

# Get the average of each measurement type per subject per activity
averageValues <- group_by(combinedData, SubjectId, ActivityId)
averageValues <- summarize_each(averageValues, funs(mean))

