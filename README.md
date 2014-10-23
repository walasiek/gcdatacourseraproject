README: Getting and cleaning the data project 1
==================================================

Author: Marcin Walas

Overview
--------

This file describes what scripts were applied to create
tidy data set from the raw data.

Requirements
------------

* R version 3.1.1 (or greater)
* R packages: plyr
* unzip program

Some helper scripts were run with the use of:
* Linux bash
* egrep
* perl

Quick how-to
------------

In order to transform raw data to tidy dataset you need to (all examples of scripts were provided for Linux OS):

* Download data from: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
** `wget -O 'UCI.zip' https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`
* unzip the file
** `unzip UCI.zip`
* run R script
** `Rscript run_analysis.R`
* The script will create a file *projectoutputwalas.txt* which contains tidy dataset

Details run_analysis.R
----------------------

The script assumes that the directory *UCI HAR Dataset* is present in the
working directory.

The script performs five steps:

* Test and training set were merged together to form one dataset
* Mean and standard deviation measurements were extracted and taken onto acount
* Descriptive activity names wre used instead of integers
* Labels for all data columns were added to the dataset
* The initial raw values were transformed to averages for all subjects (for each activity)

Step 1: Merging test and training sets
--------------------------------------

This step merges the data loaded from six files:
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/y_test.txt

Initial data object is loaded to variable: *allData*

Step 2: Extracting mean and standard deviation measurements
-----------------------------------------------------------

The script takes two first columns (activity, subject) and 66 more columns
which correspond to mean and standard deviation measurements.
The columns were extracted manually from the description
of columns file from the file from the original dataset: *UCI HAR Dataset/features.txt*

The following bash command was used to manually choose correct columns, and inject their numbers to R script:
`cat UCI\ HAR\ Dataset/features.txt |egrep 'mean[(]|std[(]'|perl -ne 'chomp; s{^(\d+) }{$1}; $i = $_ +2; print $i . ", ";'`

Remark: the measurements corresponding to MeanFreq was *not* extracted.

Step 3: Descriptive names to activities
---------------------------------------

Activities are present in the first column.
The script uses conditional subsetting to
rename itegers into strings.

Codes for integers were taken from the file: *UCI HAR Dataset/activity_labels.txt*

Step 4: Add labels to columns
-----------------------------

All labels of the columns were renamed to be more self-explanatory.

We decided to follow the following rule for naming scheme for
66 measurements: (Time|Frequency)MEASUREMENT_NAME(Mean|Sd)(X|Y|Z)
where MEASUREMENT_NAME is one of BodyAccelerometer, GravityAccelerometer,
BodyGyroscope, BodyGyroscopeMagnitude, BodyGyroscopeJerkMagnitude, etc.

We used CamelCase notation for naming columns.

Step 5: Transforming to means
-----------------------------

Each of the 66 measurements were calculated the average value
for each subject and its acitivity. The resulting values
were put into the final table with name *tidyData*.

The variable was written to the output file *projectoutputwalas.txt*

