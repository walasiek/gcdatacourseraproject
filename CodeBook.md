Code Book: Getting and cleaning the data project 1
==================================================

Author: Marcin Walas

Overview
--------

The tidy data set provided in this package comes from the
raw data downloaed from: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

The data comes from the following page: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The following steps were applied to create tidy data set:

* Test and training set were merged together to form one dataset
* Mean and standard deviation measurements were extracted and taken onto acount
* Descriptive activity names wre used instead of integers
* Labels for all data columns were added to the dataset
* The initial raw values were transformed to averages for all subjects (for each activity)

The tidy data set is created by *run_analysis.R* script (see README.md for details).

Format of the data
------------------

The data consists of 68 columns:

* *1* Activity - factor variable, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* *2* Subject - integer, id of the subject
* *3* AverageTimeBodyAccelerometerMeanX - standard gravity units 'g'
* *4* AverageTimeBodyAccelerometerMeanY - standard gravity units 'g'
* *5* AverageTimeBodyAccelerometerMeanZ - standard gravity units 'g'
* *6* AverageTimeBodyAccelerometerSdX - standard gravity units 'g'
* *7* AverageTimeBodyAccelerometerSdY - standard gravity units 'g'
* *8* AverageTimeBodyAccelerometerSdZ - standard gravity units 'g'
* *9* AverageTimeGravityAccelerometerMeanX - standard gravity units 'g'
* *10* AverageTimeGravityAccelerometerMeanY - standard gravity units 'g'
* *11* AverageTimeGravityAccelerometerMeanZ - standard gravity units 'g'
* *12* AverageTimeGravityAccelerometerSdX - standard gravity units 'g'
* *13* AverageTimeGravityAccelerometerSdY - standard gravity units 'g'
* *14* AverageTimeGravityAccelerometerSdZ - standard gravity units 'g'
* *15* AverageTimeBodyAccelerometerJerkMeanX - standard gravity units 'g'
* *16* AverageTimeBodyAccelerometerJerkMeanY - standard gravity units 'g'
* *17* AverageTimeBodyAccelerometerJerkMeanZ - standard gravity units 'g'
* *18* AverageTimeBodyAccelerometerJerkSdX - standard gravity units 'g'
* *19* AverageTimeBodyAccelerometerJerkSdY - standard gravity units 'g'
* *20* AverageTimeBodyAccelerometerJerkSdZ - standard gravity units 'g'
* *21* AverageTimeBodyGyroscopeMeanX - radians/sec
* *22* AverageTimeBodyGyroscopeMeanY - radians/sec
* *23* AverageTimeBodyGyroscopeMeanZ - radians/sec
* *24* AverageTimeBodyGyroscopeSdX - radians/sec
* *25* AverageTimeBodyGyroscopeSdY - radians/sec
* *26* AverageTimeBodyGyroscopeSdZ - radians/sec
* *27* AverageTimeBodyGyroscopeJerkMeanX - radians/sec
* *28* AverageTimeBodyGyroscopeJerkMeanY - radians/sec
* *29* AverageTimeBodyGyroscopeJerkMeanZ - radians/sec
* *30* AverageTimeBodyGyroscopeJerkSdX - radians/sec
* *31* AverageTimeBodyGyroscopeJerkSdY - radians/sec
* *32* AverageTimeBodyGyroscopeJerkSdZ - radians/sec
* *33* AverageTimeBodyAccelerometerMagnitudeMean - standard gravity units 'g'
* *34* AverageTimeBodyAccelerometerMagnitudeSd - standard gravity units 'g'
* *35* AverageTimeGravityAccelerometerMagnitudeMean - standard gravity units 'g'
* *36* AverageTimeGravityAccelerometerMagnitudeSd - standard gravity units 'g'
* *37* AverageTimeBodyAccelerometerJerkMagnitudeMean - standard gravity units 'g'
* *38* AverageTimeBodyAccelerometerJerkMagnitudeSd - standard gravity units 'g'
* *39* AverageTimeBodyGyroscopeMagnitudeMean - radians/sec
* *40* AverageTimeBodyGyroscopeMagnitudeSd - radians/sec
* *41* AverageTimeBodyGyroscopeJerkMagnitudeMean - radians/sec
* *42* AverageTimeBodyGyroscopeJerkMagnitudeSd - radians/sec
* *43* AverageFrequencyBodyAccelerometerMeanX - standard gravity units 'g'
* *44* AverageFrequencyBodyAccelerometerMeanY - standard gravity units 'g'
* *45* AverageFrequencyBodyAccelerometerMeanZ - standard gravity units 'g'
* *46* AverageFrequencyBodyAccelerometerSdX - standard gravity units 'g'
* *47* AverageFrequencyBodyAccelerometerSdY - standard gravity units 'g'
* *48* AverageFrequencyBodyAccelerometerSdZ - standard gravity units 'g'
* *49* AverageFrequencyBodyAccelerometerJerkMeanX - standard gravity units 'g'
* *50* AverageFrequencyBodyAccelerometerJerkMeanY - standard gravity units 'g'
* *51* AverageFrequencyBodyAccelerometerJerkMeanZ - standard gravity units 'g'
* *52* AverageFrequencyBodyAccelerometerJerkSdX - standard gravity units 'g'
* *53* AverageFrequencyBodyAccelerometerJerkSdY - standard gravity units 'g'
* *54* AverageFrequencyBodyAccelerometerJerkSdZ - standard gravity units 'g'
* *55* AverageFrequencyBodyGyroscopeMeanX - radians/sec
* *56* AverageFrequencyBodyGyroscopeMeanY - radians/sec
* *57* AverageFrequencyBodyGyroscopeMeanZ - radians/sec
* *58* AverageFrequencyBodyGyroscopeSdX - radians/sec
* *59* AverageFrequencyBodyGyroscopeSdY - radians/sec
* *60* AverageFrequencyBodyGyroscopeSdZ - radians/sec
* *61* AverageFrequencyBodyAccelerometerMagnitudeMean - standard gravity units 'g'
* *62* AverageFrequencyBodyAccelerometerMagnitudeSd - standard gravity units 'g'
* *63* AverageFrequencyBodyAccelerometerJerkMagnitudeMean - standard gravity units 'g'
* *64* AverageFrequencyBodyAccelerometerJerkMagnitudeSd - standard gravity units 'g'
* *65* AverageFrequencyBodyGyroscopeMagnitudeMean - radians/sec
* *66* AverageFrequencyBodyGyroscopeMagnitudeSd - radians/sec
* *67* AverageFrequencyBodyGyroscopeJerkMagnitudeMean - radians/sec
* *68* AverageFrequencyBodyGyroscopeJerkMagnitudeSd - radians/sec

Columns from 3 to 68 were normalized to the values [-1, 1].

Study design
------------

!!! Remark: study design was copied from the original README file
*UCI HAR Dataset/README.txt*


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for
generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed
by applying noise filters and then sampled in fixed-width sliding windows of 2.56
sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components, therefore
a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables from the time and frequency
domain.

Original license
----------------

This datasets uses the data from:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
