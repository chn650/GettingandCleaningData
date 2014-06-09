GettingandCleaningData
======================

Execution
--------------------------------------
1. Unzip the [data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory. You will have a folder called `UCI HAR Dataset`. Rename the folder to `data`.

2. Put `run_analysis.R` in your working directory.

3. Run `source("run_analysis.R")`.

4. The following files will be created in your working directory: `merged_data.txt` and `tidy_data.txt`

5. Use `data <- read.table("tidy_data.txt")` to read the tidy data set. This is a 180x68 data frame.
