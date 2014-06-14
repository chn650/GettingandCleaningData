#Load necessary packages
require("reshape2")


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
activity_labels[,2] <- gsub("_", "", activity_labels[,2]) #remove _

#Link the class labels with their activity name
activities <- activity_labels[activities[,1],2]

#Merge the data for subjects, activities and measurements in one data set
merged_data <- cbind(subjects, activities, measurements)

#Label the data set with descriptive variable names.
names(merged_data) <- c("subject", "activity", tolower(as.character(features[wanted_features,][,2])))
names(merged_data) <- gsub("-|\\(\\)", "", names(merged_data)) #remove - and ()

#Create a txt file for the merged data in the data folder
write.table(merged_data, "./data/merged_data.txt", row.names=FALSE))


#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
data_melt <- melt(merged_data, id=c("Subject", "Activity"))
tidy_data <- dcast(data_melt, Subject + Activity  ~ variable, mean)

#Create a txt file for the tidy data in the data folder
write.table(tidy_data, "./data/tidy_data.txt", row.names=FALSE)
