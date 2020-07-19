# Getting-and-Cleaning-Data-Assignment

This repository is my submission for Getting and Cleaning Data course project. 

Dataset: Human Activity Recognition Using Smartphones

Files
CodeBook.md modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information. 

run_analysis.R prepares the tidy data set for further analysis, based on the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names.
4. From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Avg_data.txt is the final data generated from the steps above
