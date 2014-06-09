GettingandCleaningData
======================

Execution
--------------------------------------
Unzip the [data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory. You will have a folder called `UCI HAR Dataset`. Rename the folder to `data`.

Put `run_analysis.R` in your working directory.

Run `source("run_analysis.R")`.

The following files will be created in your working directory:
* `merged_data.txt`
* `tidy_data.txt`

Use data <- read.table("tidy_data.txt") to read the tidy data set. This is a 180x68 data frame.
