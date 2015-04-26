The run_analysis scrpt works following the five steps below:

### **** Step 1 of Course Project **** ###

##Read the features.txt in order to get variables names and save in a vector
## --- Read the test set of files --- ###
## Read the test set (X_test.txt) file and save it in a data frame
## col.names are extracted from variable names from features.txt stored in myVariableNames
## Read the test subject_test.txt file 
## Read the test y_test.txt file


## --- Read the training set of files --- ###
## Read the training set (X_train.txt) file
## col.names are extracted from variable names from features.txt stored in myVariableNames
## Read the training subject_train.txt file 
## Read the train y_train.txt file


## --- Merging sets --- ##
## Merge the test and train features into using rbind because they have same variables 
## Merge the Subject variables using rbind because they have same variables
## Merge the Activity variables using rbind because they have same variables
## Merge the Subject and Activity in one data frame using cbind because they have different variables
## Build the final merged data of all needed sets in test and train using cbing because they have different variables


### **** Step 2 of Course Project **** ###

## Pattern to be search to build the subset of mean and std for each measurement.


## Subset will also contain meanFreq, which will be removed next
## Subset will not contain the additional vectors obtained by averaging the signals in a signal window sample see features.txt
## This is just to remove the meanFreq and generate another subset

### **** Step 3 of Course Project **** ###

## Read the activity_labels.txt file in order to get the descriptive activity names
## Name the activities in meanstdSubSet with their descriptive activity names in activityNames

### **** Step 4 of Course Project **** ###

## Make the variables names more descriptive
## camelCase used in order to make names more readable due length of variables names


### **** Step 5 of Course Project **** ###

## Just to make the on console display with a sample of the data
## Group the data set by Activity and Subject
## Summarise the data set by applying the mean function to each column
## Output the final tidy data in a file

The variables in the tidyData are the following:
"Activity"
"Subject"
"timeBodyAccelerationMeanX"
"timeBodyAccelerationMeanY"
"timeBodyAccelerationMeanZ"
"timeBodyAccelerationStdX"
"timeBodyAccelerationStdY"
"timeBodyAccelerationStdZ"
"timeGravityAccelerationMeanX"
"timeGravityAccelerationMeanY"
"timeGravityAccelerationMeanZ"
"timeGravityAccelerationStdX"
"timeGravityAccelerationStdY"
"timeGravityAccelerationStdZ"
"timeBodyAccelerationJerkMeanX"
"timeBodyAccelerationJerkMeanY"
"timeBodyAccelerationJerkMeanZ"
"timeBodyAccelerationJerkStdX"
"timeBodyAccelerationJerkStdY"
"timeBodyAccelerationJerkStdZ"
"timeBodyGyroscopeMeanX"
"timeBodyGyroscopeMeanY"
"timeBodyGyroscopeMeanZ"
"timeBodyGyroscopeStdX"
"timeBodyGyroscopeStdY"
"timeBodyGyroscopeStdZ"
"timeBodyGyroscopeJerkMeanX"
"timeBodyGyroscopeJerkMeanY"
"timeBodyGyroscopeJerkMeanZ"
"timeBodyGyroscopeJerkStdX"
"timeBodyGyroscopeJerkStdY"
"timeBodyGyroscopeJerkStdZ"
"timeBodyAccelerationMagnitudeMean"
"timeBodyAccelerationMagnitudeStd"
"timeGravityAccelerationMagnitudeMean"
"timeGravityAccelerationMagnitudeStd"
"timeBodyAccelerationJerkMagnitudeMean"
"timeBodyAccelerationJerkMagnitudeStd"
"timeBodyGyroscopeMagnitudeMean"
"timeBodyGyroscopeMagnitudeStd"
"timeBodyGyroscopeJerkMagnitudeMean"
"timeBodyGyroscopeJerkMagnitudeStd"
"frequencyBodyAccelerationMeanX"
"frequencyBodyAccelerationMeanY"
"frequencyBodyAccelerationMeanZ"
"frequencyBodyAccelerationStdX"
"frequencyBodyAccelerationStdY"
"frequencyBodyAccelerationStdZ"
"frequencyBodyAccelerationJerkMeanX"
"frequencyBodyAccelerationJerkMeanY"
"frequencyBodyAccelerationJerkMeanZ"
"frequencyBodyAccelerationJerkStdX"
"frequencyBodyAccelerationJerkStdY"
"frequencyBodyAccelerationJerkStdZ"
"frequencyBodyGyroscopeMeanX"
"frequencyBodyGyroscopeMeanY"
"frequencyBodyGyroscopeMeanZ"
"frequencyBodyGyroscopeStdX"
"frequencyBodyGyroscopeStdY"
"frequencyBodyGyroscopeStdZ"
"frequencyBodyAccelerationMagnitudeMean"
"frequencyBodyAccelerationMagnitudeStd"
"frequencyBodyAccelerationJerkMagnitudeMean"
"frequencyBodyAccelerationJerkMagnitudeStd"
"frequencyBodyGyroscopeMagnitudeMean"
"frequencyBodyGyroscopeMagnitudeStd"
"frequencyBodyGyroscopeJerkMagnitudeMean"
"frequencyBodyGyroscopeJerkMagnitudeStd"