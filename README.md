# GETTING AND CLEANING DATA

## COURSE PROJECT
The goal of the project is to prepare tidy data that can be used for later analysis.

## STEPS
##### **1. Merges the training and the test sets to create one data set**
First of all, we need to read all data files ("subject_train.txt", "subject_test.txt", "y_train.txt", "y_test.txt", "X_train.txt" and "X_test.txt").
After that, we will merge the training and the test sets and rename variables. We need to read other files as "features.txt" and "activity_labels.txt".

##### **2. Extracts only the measurements on the mean and standard deviation for each measurement**
We have to extract only the mean and standard deviation in "features.txt" with _grep_ function.

##### **3. Uses descriptive activity names to name the activities in the data set**
We need to enter the name of activity into data set with _merge_ function.

##### **4. Appropriately labels the data set with descriptive variable names**
In this step we have to use _gsub_ function.

##### **5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
Finally, we need to write the text on disk with _write.table_ function.
