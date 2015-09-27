File projectFinalOutput.txt contains data derived from the Samsung UCI HAR data set using the run_analysis.R script.  It is a table of 68 columns and 181 rows.  A detailed description of the run_analysis.R script is in the README.md markdown in this repository.

Row 1 contains the column headings.
Rows 2 - 181 contain the data described below.

Column 1 (subjectValue) contains an ID number for each of the thirty subjects in the Samsung study.  Values are integers from 1 to 30.

Column 2 (activityDescription) contains a description of six different physical activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Columns 3 - 68 contain mean values of selected measurements calculated by subject ID and activity.  The selected measurements are means and standard deviations described in detail in the features.txt and features_info.txt files in the Samsung data; the values in Row 1 for each column and the units of measurement match the selected variable in the Samsung data.