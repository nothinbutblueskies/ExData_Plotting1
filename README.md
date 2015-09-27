# README.md
## Getting and Cleaning Data course project

The repository file run_analysis.R is a single script that performs the following steps:

1.  Download the Samsung data (Dataset.zip) to the Desktop from the 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20 site.

2.  Unzip the Dataset.zip file.

3.  Read the X_test.txt and X_train.txt data into R from the /test and /train directories, respectively; join into one table.

4.  Read the features.txt data into R.  Create a logical vector with TRUE values when the data element contains "-mean(" or "-std(", FALSE otherwise.  Use logical vector to remove columns from the joined test and train data and from the features data that are not means or standard deviations.

5.  Use the subset of features data to label the columns in the subset of the joined test and train data.

6.  Read the y_test.txt and y_train.txt activity data into R from the /test and /train directories, respectively; join into one table.

7.  Read the subject_test.txt and subject_train.txt subject data into R from the /test and /train directories, respectively; join into one table.

8.  Make one data frame from the activity, subject, and joined test and train data.

9.  Read the activity_labels.txt data into R and merge it with the data frame from 8 above to give descriptions to the activity values.

10.  Calculate mean values for each column of data by activity and subject.

11.  Write resulting data frame to disk.

The repository file CodeBook.md describes the contents of the output file created by the run_analysis.R script: projectFinalOutput.txt

