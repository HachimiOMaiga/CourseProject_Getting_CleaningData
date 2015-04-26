### **** Step 1 of Course Project **** ###

## Read the features.txt in order to get variables names and save in a vector
myVariableNames <- read.table("./UCI HAR Dataset/features.txt", sep = "")

## --- Read the test set of files --- ###
## Read the test set (X_test.txt) file and save it in a data frame
## col.names are extracted from variable names from features.txt stored in myVariableNames
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, 
                      sep = "", col.names = myVariableNames[, 2])

## Read the test subject_test.txt file 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, 
                          sep = "", col.names = "Subject")

## Read the test y_test.txt file
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, 
                           sep = "", col.names = "Activity")

## --- Read the training set of files --- ###
## Read the training set (X_train.txt) file
## col.names are extracted from variable names from features.txt stored in myVariableNames
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                       sep = "", col.names = myVariableNames[, 2])

## Read the training subject_train.txt file 
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                           sep = "", col.names = "Subject")

## Read the train y_train.txt file
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                            sep = "", col.names = "Activity")

## --- Merging sets --- ##
## Merge the test and train features into using rbind because they have same variables 
mergedTestTrainFeatures <- rbind(testSet, trainSet)

## Merge the Subject variables using rbind because they have same variables
mergedSubject <- rbind(testSubject, trainSubject)

## Merge the Activity variables using rbind because they have same variables
mergedActivity <- rbind(testActivity, trainActivity)

## Merge the Subject and Activity in one data frame using cbind because 
## they have different variables
mergedSubjectActivity <- cbind(mergedSubject, mergedActivity)

## Build the final merged data of all needed sets in test and train using cbing 
## because they have different variables
mergedTestTrainFinalSet <- cbind(mergedTestTrainFeatures, mergedSubjectActivity)

### **** Step 2 of Course Project **** ###

## Pattern to be search to build the subset of mean and std for each measurement.
search_string <- c("mean", "std", "Subject", "Activity")

## Subset will also contain meanFreq, which will be removed next
## Subset will not contain the additional vectors obtained by averaging 
## the signals in a signal window sample see features.txt
meanstdmeanFeqSubSet <- mergedTestTrainFinalSet[, grep(paste(search_string, collapse = '|'), 
                                                       colnames(mergedTestTrainFinalSet))]

## This is just to remove the meanFreq and generate another subset
meanstdSubSet <- meanstdmeanFeqSubSet[, -grep("meanFreq", colnames(meanstdmeanFeqSubSet))]

### **** Step 3 of Course Project **** ###

## Read the activity_labels.txt file in order to get the descriptive activity names
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", 
                            header = FALSE, col.names = c("Activity.Labels", "Activity.Names"))

## Name the activities in meanstdSubSet with their descriptive activity names 
## in activityNames
meanstdSubSet[, "Activity"] <- activityNames[meanstdSubSet[, "Activity"], "Activity.Names"]

### **** Step 4 of Course Project **** ###

## Make the variables names more descriptive
## camelCase used in order to make names more readable due length of variables names
descriptiveColumnNames <- sub("^t", "time", colnames(meanstdSubSet))
descriptiveColumnNames <- sub("^f", "frequency", descriptiveColumnNames)
descriptiveColumnNames <- gsub("Acc", "Acceleration", descriptiveColumnNames)
descriptiveColumnNames <- gsub("Gyro", "Gyroscope", descriptiveColumnNames)
descriptiveColumnNames <- gsub("Mag", "Magnitude", descriptiveColumnNames)
descriptiveColumnNames <- gsub("BodyBody", "Body", descriptiveColumnNames)
descriptiveColumnNames <- gsub("\\.", "", descriptiveColumnNames)
descriptiveColumnNames <- gsub("mean", "Mean", descriptiveColumnNames)
descriptiveColumnNames <- gsub("std", "Std", descriptiveColumnNames)
descriptiveColumnNames
length(descriptiveColumnNames)
colnames(meanstdSubSet) <- descriptiveColumnNames

### **** Step 5 of Course Project **** ###
library(dplyr)

## Just to make the on console display with a sample of the data
meanstdSubSet_df <- tbl_df(meanstdSubSet)

## Group the data set by Activity and Subject
by_Activity_Subject <- group_by(meanstdSubSet_df, Activity, Subject)

## Summarise the data set by applying the mean function to each column
tidy_Data_Set <- summarise_each(by_Activity_Subject, funs(mean))

## Output the final tidy data in a file
write.table(tidy_Data_Set, "./tidyData.txt", row.names = FALSE)

