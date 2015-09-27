# This script is for the Getting and Cleaning Data course project.
#

# Step 0: Download project data and uncompress it.
#
setwd("/home/jason/Desktop/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "/home/jason/Desktop/UCI_HAR_Dataset.zip", method="curl")
unzip("./UCI_HAR_Dataset.zip")

# Step 1: Merge the training and the test sets to create one data set.
#
setwd("/home/jason/Desktop/UCI HAR Dataset/test/")
testData <- read.table("X_test.txt")
setwd("/home/jason/Desktop/UCI HAR Dataset/train/")
trainData <- read.table("X_train.txt")
data <- rbind(testData, trainData)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
#
setwd("/home/jason/Desktop/UCI HAR Dataset/")
features <- read.table("features.txt")
featuresMeanStdOnlyLogical <- grepl("-mean\\(|-std\\(", features$V2)
dataMeanStdOnly <- data[, featuresMeanStdOnlyLogical]
featuresMeanStdOnly <- subset(features, featuresMeanStdOnlyLogical, select=2)

# Step 4: Appropriately label the data set with descriptive variable names.
#
colnames(dataMeanStdOnly) <- featuresMeanStdOnly$V2

# Step 3: Uses descriptive activity names to name the activities in the data set.
#
# Read in subject and activity data sets that will be joined to features data set
setwd("/home/jason/Desktop/UCI HAR Dataset/test/")
testActivity <- read.table("y_test.txt")
testSubject <- read.table("subject_test.txt")
setwd("/home/jason/Desktop/UCI HAR Dataset/train/")
trainActivity <- read.table("y_train.txt")
trainSubject <- read.table("subject_train.txt")
activity <- rbind(testActivity, trainActivity)
subject <- rbind(testSubject, trainSubject)
colnames(activity) <- c("activityValue")
colnames(subject) <- c("subjectValue")

# Read in activity labels
setwd("/home/jason/Desktop/UCI HAR Dataset/")
activityLabels <- read.table("activity_labels.txt")
colnames(activityLabels) <- c("activityValue", "activityDescription")

# Join activity and subject data sets to subset of features data set
dataMeanStdOnly <- cbind(activity, subject, dataMeanStdOnly)

# Add a column wth activity description
dataMeanStdOnly <- merge(dataMeanStdOnly, activityLabels, by="activityValue")

# Step 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.
result <- aggregate(dataMeanStdOnly[,3:68], dataMeanStdOnly[c("subjectValue", "activityDescription")], mean)

# Write output for project submission
setwd("/home/jason/Desktop/")
write.table(result, file="projectFinalOutput.txt", row.name=FALSE)
