if(!file.exists(".data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/data.zip", method="curl")
unzip(zipfile="./data/data.zip", exdir="./data")
# Read files
filesPath <- "/home/clara/data/UCI HAR Dataset"
subject_train <- read.table(file.path(filesPath, "train", "subject_train.txt"))
subject_test <- read.table(file.path(filesPath, "test", "subject_test.txt"))
y_train <- read.table(file.path(filesPath, "train", "y_train.txt"))
y_test <- read.table(file.path(filesPath, "test", "y_test.txt"))
x_train <- read.table(file.path(filesPath, "train", "X_train.txt"))
x_test <- read.table(file.path(filesPath, "test", "X_test.txt"))
# Merges the training and the test sets to create one data set
all_subject <- rbind(subject_train, subject_test)
setnames(all_subject, "V1", "subject")
all_y <- rbind(y_train, y_test)
setnames(all_y, "V1", "activity")
all_x <- rbind(x_train, x_test)
features <- read.table(file.path(filesPath, "features.txt"))
setnames(features, names(features), c("featureNum", "featureName"))
colnames(all_x) <- features$featureName
activity_labels <- read.table(file.path(filesPath, "activity_labels.txt"))
setnames(activity_labels, names(activity_labels), c("activity", "activityName"))
table <- cbind(all_subject, all_y)
table_def <- cbind(table, all_x)
# Extracts only the measurements on the mean and standard deviation for each measurement
features_mean_sd <- grep("mean\\(\\)|std\\(\\)", features$featureName, value=TRUE)
join_names <- union(c("subject", "activity"), features_mean_sd)
table_def <- subset(table_def, select=features_mean_sd)
# Uses descriptive activity names to name the activities in the data set
table_def <- merge(activity_labels, table_def, by="activity", all.x=TRUE)
# Appropriately labels the data set with descriptive variable names
names(table_def)<-gsub("std()", "SD", names(table_def))
names(table_def)<-gsub("mean()", "MEAN", names(table_def))
names(table_def)<-gsub("^t", "time", names(table_def))
names(table_def)<-gsub("^f", "frequency", names(table_def))
names(table_def)<-gsub("Acc", "Accelerometer", names(table_def))
names(table_def)<-gsub("Gyro", "Gyroscope", names(table_def))
names(table_def)<-gsub("Mag", "Magnitude", names(table_def))
names(table_def)<-gsub("BodyBody", "Body", names(table_def))
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
write.table(table_def, file = "tidydata.txt",row.name=FALSE)