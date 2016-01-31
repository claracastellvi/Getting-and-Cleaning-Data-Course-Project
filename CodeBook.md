# CODE BOOK

### SUBJECT AND ACTIVITY

These variables identify the unique subject/activity pair the variables relate to:
**Subject**: the integer subject ID.

**Activity**: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying.
### THE DATA
The dataset includes the following files:
1. Readme.txt
2. features_info.txt
3. features.txt
4. activity_labels.txt
5. subject test/train
6. Y train/test
7. X train/test

### TRANSFORMATION DETAILS
1. Require _data.table_ library.
2. Load both test and train data
3. Load the features and activity labels
4. Extract the mean and standard deviation column names and data
5. Process the data. There are two parts processing test and train data respectively.
6. Merge data set.
