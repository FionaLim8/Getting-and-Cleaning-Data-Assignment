**Purpose**

The purpose of this Code book is to describe the variables, the data, and any transformations or work that has been performed to clean up the data, using the steps below:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Download data**

Download and unzip file - UCI HAR Dataset

**Read Dataset**

There are 28 files in UCI HAR Dataset. The following files are read into:
1. x_test = X_test.txt
2. y_text = y_test.txt
3. subject_text = subject_test.txt
4. x_train = X_train.txt
5. y_train = y_train.txt
6. subject_train = subject_train.txt
7. features = features.txt
8. activity_labels = activity_labels.txt


**Merges the training and the test sets to create one data set**

1. M_test merges all the columns for subject_test, y_test, x_test
2. M_train merges all the columns for ubject_train, y_train, x_train
3. All_data was created by appending M_test to M_train

**Column names were then created into meaningful variables**
1. First 2 columns were renamed to "Activity_Num" and "Subject_Num"
2. The rest of the columns were renamed to the observations in Features
3. For activity_labels, columns were renamed to 'Activity_Num', 'Activity', so as to have a common link to All_data

**Extract mean and std deviation for each measurement**

OnlyMean_Std extracts the mean and standard deviation by selecting columns that contain "-mean" or "-std"

**Uses descriptive activity names to name the activities in the data set**

ActivityName merged the dataset for activity_labels and OnlyMean_Std using the column "Activity_Num"

**From the data set above step, creates a second, independent tidy data set with the average of each variable for each activity and each subject**

Avg gave the mean of each variable, for each activity and subject, through the use of the 'aggregate' function. There were 180 rows and 82 variables (including Subject_Num, Activity_Num and Activity).
The results were then written into "Avg_data.txt"
