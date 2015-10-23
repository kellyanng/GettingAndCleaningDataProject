# GettingAndCleaningDataProject

This project contains 3 files:
1. This README.md that explains the project and the data transformations that occured.
2. ColumnNames.txt: The code book for the project defining the names of the resulting columns
3. run_analysis.R that runs the steps defined in this readme.

run_analysis.R assumes the data is in a folder called "UCI HAR Dataset" under the working directory.
It reads the following 6 files in the following way:
1. train/x_train.txt and test/x_test.txt are both read in and combined to make a single set of all values read
2. features.txt is read in and used as the column names for the data imported in step 1
3. The result from step 2 is then reduced down to only columns that contain the words "std" or "mean" to get any standard deviation or mean values.  This includes meanFreq since that's a version of the mean.
4. train/y_train.txt and test/y_test.txt are both read in and combined to make a single column defining the numeric IDs of the actions to take.  
5. The result from step 2 is joined with the names from activity_labels.txt to get meaningful names for the activities. 
6. train/subject_train.txt and test/subject_test.txt are both read in and combined to make a single column defining the numeric IDs of the subjects
7. The columns from step 5 and 6 are added as columns to the table from step 3.
8. The average of each group of subjects and activites are taken
