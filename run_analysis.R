#Open dplyr
library('dplyr')

# Unzip DataSet given to another filepath
unzip(zipfile="getdata_projectfiles_UCI HAR Dataset.zip",exdir="./data")

#define path of the new unzipped folder
path = file.path("./data", "UCI HAR Dataset")

#Read the testing tables
x_test = read.table(file.path(path, "test", "X_test.txt"),header = FALSE)
y_test = read.table(file.path(path, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(path, "test", "subject_test.txt"),header = FALSE)

#Read training tables 
x_train = read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
y_train = read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)

#Read features 
features = read.table(file.path(path, "features.txt"),header = FALSE)

#Read activity labels
activity_labels = read.table(file.path(path, "activity_labels.txt"),header = FALSE)


##1. Merges the training and the test sets to create one data set
M_test <- bind_cols(subject_test, y_test, x_test)
M_train <- bind_cols(subject_train, y_train, x_train)
All_data <- bind_rows(M_test, M_train)

##2. Rename column names
names(All_data)[1] <- "Subject_Num"
names(All_data)[2] <- "Activity_Num"
names(All_data)[3:563] <- features[, 2]
names(activity_labels)[1] <- "Activity_Num"
names(activity_labels)[2] <- "Activity"

##3. Extract mean and std deviation for each measurement
OnlyMean_Std <-All_data %>% 
  select(Subject_Num, Activity_Num, contains("-mean"), contains("-std"))

##4. From the data set above step, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.
Avg <- aggregate(.~ Subject_Num + Activity_Num  + Activity, ActivityName, mean)

#Write output to text file
write.table(Avg, "Avg_data.txt", row.name = FALSE)