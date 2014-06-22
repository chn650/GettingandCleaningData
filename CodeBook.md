Code Book
======================


Data Description 
------------------
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.[1]

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For more information about the study: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

 
 

Transformation Steps
---------------------
For the `merged_data.txt`:

1. Merge training and testing data for measurements, activities and subjects.
 -  measurements are binded into a 10299x561 data frame
 -  activities are binded into a 10299x1 data frame
 -  subjects are binded into a 10299x1 data frame

2. Extract only the measurements on the mean and standard deviation for each measurement.
 - This changes the measurements data frame to a 10299x66 data frame
 
3. Link the class labels with their activity name, so we see the activity not numbers.
 - The activity names are changed from upper case to lowercase.
 - The "_" in the activity names are removed
 
4. Merge the data for subjects, activities and measurements in one data set.
 - This creates a 10299x68 data frame

5. Label the data set with descriptive variable names.
 - variable names are changed to being all lower case, because missing caps can lead to difficult to find bugs in data analysis
 - The "-" and "()" are removed from the variable names, because these characters are not allowed in R names. If you read the data into are these characters will be converted into a "."


For the `tidy_data.txt`:

1. Melt the data rom the `merged_data.txt` so that each row is a unique id-variable combination. The activity and subject are used as id.
 - This creates a 679734x4 data frame
 
2. Cast the melted data into a new data frame with the average of each variable for each activity and each subject.
 - This creates a 180x68 data frame



Variable Description 
---------------------
subject: the numbers 1 to 30 represent the individuals that participated in the study

activity: the subjects performed 6 different activities (laying, sitting, standing, walking, walking downstairs, walking upstairs)

The other variables are a combination the following:
* t: time domain signal
* f: frequency domain signal
* body: body motion components
* gravity:gravitational motion components
* acc: accelerometer signal
* jerk: body linear acceleration and angular velocity derived in time
* gyro: gyroscope signal 
* mag: magnitude of the signals
* mean: average
* std: standard deviation
* x: x-axis of the three-dimensional signals
* y: y-axis of the three-dimensional signals
* z: z-axis of the three-dimensional signals



List of Variables 
----------
1                   subject     
2                  activity     
3             tbodyaccmeanx     
4             tbodyaccmeany     
5             tbodyaccmeanz     
6              tbodyaccstdx     
7              tbodyaccstdy     
8              tbodyaccstdz     
9          tgravityaccmeanx     
10         tgravityaccmeany     
11         tgravityaccmeanz     
12          tgravityaccstdx     
13          tgravityaccstdy     
14          tgravityaccstdz     
15        tbodyaccjerkmeanx     
16        tbodyaccjerkmeany     
17        tbodyaccjerkmeanz     
18         tbodyaccjerkstdx     
19         tbodyaccjerkstdy     
20         tbodyaccjerkstdz     
21           tbodygyromeanx     
22           tbodygyromeany     
23           tbodygyromeanz     
24            tbodygyrostdx     
25            tbodygyrostdy     
26            tbodygyrostdz     
27       tbodygyrojerkmeanx     
28       tbodygyrojerkmeany     
29       tbodygyrojerkmeanz     
30        tbodygyrojerkstdx     
31        tbodygyrojerkstdy     
32        tbodygyrojerkstdz     
33          tbodyaccmagmean     
34           tbodyaccmagstd     
35       tgravityaccmagmean     
36        tgravityaccmagstd     
37      tbodyaccjerkmagmean     
38       tbodyaccjerkmagstd     
39         tbodygyromagmean     
40          tbodygyromagstd     
41     tbodygyrojerkmagmean     
42      tbodygyrojerkmagstd     
43            fbodyaccmeanx     
44            fbodyaccmeany     
45            fbodyaccmeanz     
46             fbodyaccstdx     
47             fbodyaccstdy     
48             fbodyaccstdz     
49        fbodyaccjerkmeanx     
50        fbodyaccjerkmeany     
51        fbodyaccjerkmeanz     
52         fbodyaccjerkstdx     
53         fbodyaccjerkstdy     
54         fbodyaccjerkstdz     
55           fbodygyromeanx     
56           fbodygyromeany     
57           fbodygyromeanz     
58            fbodygyrostdx     
59            fbodygyrostdy     
60            fbodygyrostdz     
61          fbodyaccmagmean     
62           fbodyaccmagstd     
63  fbodybodyaccjerkmagmean     
64   fbodybodyaccjerkmagstd     
65     fbodybodygyromagmean     
66      fbodybodygyromagstd     
67 fbodybodygyrojerkmagmean     
68  fbodybodygyrojerkmagstd     


References
-----------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
