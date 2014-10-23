library(plyr)
# Step 1. Merges the training and the test sets to create one data set.

xTrainData <- read.table('UCI HAR Dataset/train/X_train.txt')
subjectTrainData <- read.table('UCI HAR Dataset/train/subject_train.txt')
yTrainData <- read.table('UCI HAR Dataset/train/y_train.txt')

xTestData <- read.table('UCI HAR Dataset/test/X_test.txt')
subjectTestData <- read.table('UCI HAR Dataset/test/subject_test.txt')
yTestData <- read.table('UCI HAR Dataset/test/y_test.txt')

allTrainData <- cbind(yTrainData,subjectTrainData, xTrainData)
allTestData <- cbind(yTestData, subjectTestData, xTestData)

allData <- rbind(allTrainData, allTestData)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Remark: only strict Mean and Sd were extracted (so e.g. MeanFreq is not extracted)

colsToTake <- c(1,2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86, 87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166, 167, 168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428, 429, 430, 431, 505, 506, 518, 519, 531, 532, 544, 545)

allData <- allData[,colsToTake]

# Step 3. Uses descriptive activity names to name the activities in the data set
# Note: activities are placed in the first columns at this point
allData[allData[,1] == 1, 1] <- 'WALKING'
allData[allData[,1] == 2, 1] <- 'WALKING_UPSTAIRS'
allData[allData[,1] == 3, 1] <- 'WALKING_DOWNSTAIRS'
allData[allData[,1] == 4, 1] <- 'SITTING'
allData[allData[,1] == 5, 1] <- 'STANDING'
allData[allData[,1] == 6, 1] <- 'LAYING'

# Step 4. Appropriately labels the data set with descriptive variable names.
names(allData) <- c(
    'Activity',
    'Subject',
    'TimeBodyAccelerometerMeanX',
    'TimeBodyAccelerometerMeanY',
    'TimeBodyAccelerometerMeanZ',
    'TimeBodyAccelerometerSdX',
    'TimeBodyAccelerometerSdY',
    'TimeBodyAccelerometerSdZ',
    'TimeGravityAccelerometerMeanX',
    'TimeGravityAccelerometerMeanY',
    'TimeGravityAccelerometerMeanZ',
    'TimeGravityAccelerometerSdX',
    'TimeGravityAccelerometerSdY',
    'TimeGravityAccelerometerSdZ',
    'TimeBodyAccelerometerJerkMeanX',
    'TimeBodyAccelerometerJerkMeanY',
    'TimeBodyAccelerometerJerkMeanZ',
    'TimeBodyAccelerometerJerkSdX',
    'TimeBodyAccelerometerJerkSdY',
    'TimeBodyAccelerometerJerkSdZ',
    'TimeBodyGyroscopeMeanX',
    'TimeBodyGyroscopeMeanY',
    'TimeBodyGyroscopeMeanZ',
    'TimeBodyGyroscopeSdX',
    'TimeBodyGyroscopeSdY',
    'TimeBodyGyroscopeSdZ',
    'TimeBodyGyroscopeJerkMeanX',
    'TimeBodyGyroscopeJerkMeanY',
    'TimeBodyGyroscopeJerkMeanZ',
    'TimeBodyGyroscopeJerkSdX',
    'TimeBodyGyroscopeJerkSdY',
    'TimeBodyGyroscopeJerkSdZ',
    'TimeBodyAccelerometerMagnitudeMean',
    'TimeBodyAccelerometerMagnitudeSd',
    'TimeGravityAccelerometerMagnitudeMean',
    'TimeGravityAccelerometerMagnitudeSd',
    'TimeBodyAccelerometerJerkMagnitudeMean',
    'TimeBodyAccelerometerJerkMagnitudeSd',
    'TimeBodyGyroscopeMagnitudeMean',
    'TimeBodyGyroscopeMagnitudeSd',
    'TimeBodyGyroscopeJerkMagnitudeMean',
    'TimeBodyGyroscopeJerkMagnitudeSd',
    'FrequencyBodyAccelerometerMeanX',
    'FrequencyBodyAccelerometerMeanY',
    'FrequencyBodyAccelerometerMeanZ',
    'FrequencyBodyAccelerometerSdX',
    'FrequencyBodyAccelerometerSdY',
    'FrequencyBodyAccelerometerSdZ',
    'FrequencyBodyAccelerometerJerkMeanX',
    'FrequencyBodyAccelerometerJerkMeanY',
    'FrequencyBodyAccelerometerJerkMeanZ',
    'FrequencyBodyAccelerometerJerkSdX',
    'FrequencyBodyAccelerometerJerkSdY',
    'FrequencyBodyAccelerometerJerkSdZ',
    'FrequencyBodyGyroscopeMeanX',
    'FrequencyBodyGyroscopeMeanY',
    'FrequencyBodyGyroscopeMeanZ',
    'FrequencyBodyGyroscopeSdX',
    'FrequencyBodyGyroscopeSdY',
    'FrequencyBodyGyroscopeSdZ',
    'FrequencyBodyAccelerometerMagnitudeMean',
    'FrequencyBodyAccelerometerMagnitudeSd',
    'FrequencyBodyAccelerometerJerkMagnitudeMean',
    'FrequencyBodyAccelerometerJerkMagnitudeSd',
    'FrequencyBodyGyroscopeMagnitudeMean',
    'FrequencyBodyGyroscopeMagnitudeSd',
    'FrequencyBodyGyroscopeJerkMagnitudeMean',
    'FrequencyBodyGyroscopeJerkMagnitudeSd'
)

# Step 5. From the data set in step 4, creates a second,
# independent tidy data set with the average
# of each variable for each activity and each subject.

tidyData <- ddply(
    allData, c(.(Activity), .(Subject)), summarize,
    AverageTimeBodyAccelerometerMeanX = mean(TimeBodyAccelerometerMeanX,na.rm=TRUE),
    AverageTimeBodyAccelerometerMeanY = mean(TimeBodyAccelerometerMeanY,na.rm=TRUE),
    AverageTimeBodyAccelerometerMeanZ = mean(TimeBodyAccelerometerMeanZ,na.rm=TRUE),
    AverageTimeBodyAccelerometerSdX = mean(TimeBodyAccelerometerSdX,na.rm=TRUE),
    AverageTimeBodyAccelerometerSdY = mean(TimeBodyAccelerometerSdY,na.rm=TRUE),
    AverageTimeBodyAccelerometerSdZ = mean(TimeBodyAccelerometerSdZ,na.rm=TRUE),
    AverageTimeGravityAccelerometerMeanX = mean(TimeGravityAccelerometerMeanX,na.rm=TRUE),
    AverageTimeGravityAccelerometerMeanY = mean(TimeGravityAccelerometerMeanY,na.rm=TRUE),
    AverageTimeGravityAccelerometerMeanZ = mean(TimeGravityAccelerometerMeanZ,na.rm=TRUE),
    AverageTimeGravityAccelerometerSdX = mean(TimeGravityAccelerometerSdX,na.rm=TRUE),
    AverageTimeGravityAccelerometerSdY = mean(TimeGravityAccelerometerSdY,na.rm=TRUE),
    AverageTimeGravityAccelerometerSdZ = mean(TimeGravityAccelerometerSdZ,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkMeanX = mean(TimeBodyAccelerometerJerkMeanX,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkMeanY = mean(TimeBodyAccelerometerJerkMeanY,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkMeanZ = mean(TimeBodyAccelerometerJerkMeanZ,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkSdX = mean(TimeBodyAccelerometerJerkSdX,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkSdY = mean(TimeBodyAccelerometerJerkSdY,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkSdZ = mean(TimeBodyAccelerometerJerkSdZ,na.rm=TRUE),
    AverageTimeBodyGyroscopeMeanX = mean(TimeBodyGyroscopeMeanX,na.rm=TRUE),
    AverageTimeBodyGyroscopeMeanY = mean(TimeBodyGyroscopeMeanY,na.rm=TRUE),
    AverageTimeBodyGyroscopeMeanZ = mean(TimeBodyGyroscopeMeanZ,na.rm=TRUE),
    AverageTimeBodyGyroscopeSdX = mean(TimeBodyGyroscopeSdX,na.rm=TRUE),
    AverageTimeBodyGyroscopeSdY = mean(TimeBodyGyroscopeSdY,na.rm=TRUE),
    AverageTimeBodyGyroscopeSdZ = mean(TimeBodyGyroscopeSdZ,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkMeanX = mean(TimeBodyGyroscopeJerkMeanX,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkMeanY = mean(TimeBodyGyroscopeJerkMeanY,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkMeanZ = mean(TimeBodyGyroscopeJerkMeanZ,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkSdX = mean(TimeBodyGyroscopeJerkSdX,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkSdY = mean(TimeBodyGyroscopeJerkSdY,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkSdZ = mean(TimeBodyGyroscopeJerkSdZ,na.rm=TRUE),
    AverageTimeBodyAccelerometerMagnitudeMean = mean(TimeBodyAccelerometerMagnitudeMean,na.rm=TRUE),
    AverageTimeBodyAccelerometerMagnitudeSd = mean(TimeBodyAccelerometerMagnitudeSd,na.rm=TRUE),
    AverageTimeGravityAccelerometerMagnitudeMean = mean(TimeGravityAccelerometerMagnitudeMean,na.rm=TRUE),
    AverageTimeGravityAccelerometerMagnitudeSd = mean(TimeGravityAccelerometerMagnitudeSd,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkMagnitudeMean = mean(TimeBodyAccelerometerJerkMagnitudeMean,na.rm=TRUE),
    AverageTimeBodyAccelerometerJerkMagnitudeSd = mean(TimeBodyAccelerometerJerkMagnitudeSd,na.rm=TRUE),
    AverageTimeBodyGyroscopeMagnitudeMean = mean(TimeBodyGyroscopeMagnitudeMean,na.rm=TRUE),
    AverageTimeBodyGyroscopeMagnitudeSd = mean(TimeBodyGyroscopeMagnitudeSd,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkMagnitudeMean = mean(TimeBodyGyroscopeJerkMagnitudeMean,na.rm=TRUE),
    AverageTimeBodyGyroscopeJerkMagnitudeSd = mean(TimeBodyGyroscopeJerkMagnitudeSd,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerMeanX = mean(FrequencyBodyAccelerometerMeanX,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerMeanY = mean(FrequencyBodyAccelerometerMeanY,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerMeanZ = mean(FrequencyBodyAccelerometerMeanZ,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerSdX = mean(FrequencyBodyAccelerometerSdX,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerSdY = mean(FrequencyBodyAccelerometerSdY,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerSdZ = mean(FrequencyBodyAccelerometerSdZ,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkMeanX = mean(FrequencyBodyAccelerometerJerkMeanX,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkMeanY = mean(FrequencyBodyAccelerometerJerkMeanY,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkMeanZ = mean(FrequencyBodyAccelerometerJerkMeanZ,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkSdX = mean(FrequencyBodyAccelerometerJerkSdX,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkSdY = mean(FrequencyBodyAccelerometerJerkSdY,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkSdZ = mean(FrequencyBodyAccelerometerJerkSdZ,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeMeanX = mean(FrequencyBodyGyroscopeMeanX,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeMeanY = mean(FrequencyBodyGyroscopeMeanY,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeMeanZ = mean(FrequencyBodyGyroscopeMeanZ,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeSdX = mean(FrequencyBodyGyroscopeSdX,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeSdY = mean(FrequencyBodyGyroscopeSdY,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeSdZ = mean(FrequencyBodyGyroscopeSdZ,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerMagnitudeMean = mean(FrequencyBodyAccelerometerMagnitudeMean,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerMagnitudeSd = mean(FrequencyBodyAccelerometerMagnitudeSd,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkMagnitudeMean = mean(FrequencyBodyAccelerometerJerkMagnitudeMean,na.rm=TRUE),
    AverageFrequencyBodyAccelerometerJerkMagnitudeSd = mean(FrequencyBodyAccelerometerJerkMagnitudeSd,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeMagnitudeMean = mean(FrequencyBodyGyroscopeMagnitudeMean,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeMagnitudeSd = mean(FrequencyBodyGyroscopeMagnitudeSd,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeJerkMagnitudeMean = mean(FrequencyBodyGyroscopeJerkMagnitudeMean,na.rm=TRUE),
    AverageFrequencyBodyGyroscopeJerkMagnitudeSd = mean(FrequencyBodyGyroscopeJerkMagnitudeSd,na.rm=TRUE)
)

# Last step: write output
write.table(tidyData, file='projectoutputwalas.txt',row.name=FALSE)
