#Load necessary packages
library("reshape2")


#Load training and testing data
training_measurements <- read.table("./data/train/X_train.txt")
test_measurements <- read.table("./data/test/X_test.txt")

training_activities <- read.table("./data/train/y_train.txt")
test_activities <- read.table("./data/test/y_test.txt")

training_subjects <- read.table("./data/train/subject_train.txt")
test_subjects <- read.table("./data/test/subject_test.txt")

#Merge training and testing data for measurements, activities and subjects
measurements <- rbind(training_measurements, test_measurements)
activities <- rbind(training_activities, test_activities )
subjects <- rbind(training_subjects, test_subjects )

#Extract only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./data/features.txt")
wanted_features <- grepl("mean\\(\\)|std\\(\\)", features[,2])

measurements <- measurements[,wanted_features]

#Read activity labels
activity_labels <- read.table("./data/activity_labels.txt")
activity_labels[,2] <- tolower(as.character(activity_labels[,2])) #change from upper to lower case

#Link the class labels with their activity name
activities <- activity_labels[activities[,1],2]

#Merge the data for subjects, activities and measurements in one data set
merged_data <- cbind(subjects, activities, measurements)

#Label the data set with descriptive variable names.
colnames(merged_data) <- c("Subject", "Activity", as.character(features[wanted_features,][,2]))
colnames(merged_data) <- gsub("\\(\\)", "", colnames(merged_data)) #remove ()
colnames(merged_data) <- gsub("-", "_", colnames(merged_data)) #change - to _

#Create a txt file for the merged data
write.table(merged_data, "merged_data.txt")


#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
data_melt <- melt(merged_data, id=c("Subject", "Activity"))
tidy_data <- dcast(data_melt, Subject + Activity  ~ variable, mean)

#Create a txt file for the tidy data
write.table(tidy_data, "tidy_data.txt")
