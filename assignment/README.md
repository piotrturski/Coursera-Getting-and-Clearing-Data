## Getting and Cleaning Data Course Project

### Usage
* Unzip https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your working directory
* make sure you have `UCI HAR Dataset` folder and `run_analysis.R` script in your working directory
* in R run `source("run_analysis.R")`, it may take a few seconds

### Results
After executing the code, you should see:

* file `tidy_means.txt` in your working directory. it contains all the means you can read is using `read.table("tidy_means.txt", header = T)`
* `tidy` variable in your current environment

### How does it work?
First, `tidy` set is computed, later new set with means is computed and written to a file.

####tidy set
The following diagram represents the resulting, tidy dataset (stored in the `tidy` variable). Top row represents column names.
```
+---------------------------+-------------------------+-------------------------------------------+
|                           |                         |              feature names                |
|       'subject'           |       'activity'        |                                           |
|                           |                         | from `features.txt`; cleared and selected |
|                           |                         | only means and standard deviations        |
+===========================+=========================+===========================================+
|                           |                         |                                           |
| subject ids (train)       | activity labels (train) |           measurements (train)            |
|                           |                         |                                           |
| directly from             | positions from          | from 'train/X_train.txt'                  |
| 'train/subject_train.txt' | 'train/y_train.txt'     | selected same columns as for              |
|                           | labels from             | feature names                             |
|                           | 'activity_labels.txt'   |                                           |
+---------------------------+-------------------------+-------------------------------------------+
|                           |                         |                                           |
| subject ids (test)        | activity labels (test)  |           measurements (test)             |
|                           |                         |                                           |
| directly from             | positions from          | from 'test/X_test.txt'                    |
| 'test/subject_test.txt'   | 'test/y_test.txt'       | selected same columns as for              |
|                           | labels from             | feature names                             |
|                           | 'activity_labels.txt'   |                                           |
+---------------------------+-------------------------+-------------------------------------------+
```

#### means
File `tidy_means.txt` is built from the `tidy` set by grouping and summarizing data. Set is grouped by `subject` and `activity` columns and means are calculated for each column in each group independently. Resulting data set has same exactly the same structure but instead of measurements, means are stored.