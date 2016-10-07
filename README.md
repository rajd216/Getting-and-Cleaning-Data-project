# Getting-and-Cleaning-Data-project

The goal is to read the dataset "Human Activity Recognition Using Smartphones", perform analysis on the dataset and create a tidy dataset. Below are the steps mentioned that must be done before running the R script "run_analysis.R":

Run the script run_analysis.R. The script produces a single output file, tidy-data.csv, that contains the merged and transformed data.

Download the zip file from this URL

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the file and move all of the following files to the SAME DIRECTORY as the R script

X_train.txt
X_test.txt
y_train.txt
y_test.txt
features.txt
subject_train.txt
subject_test.txt

Set the working directory to the folder containing the activity recognition dataset.
Install the required packages such as data.table and reshape2.

Next you can work and run the run_analysis.R script that does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

References - Human Activity Recognition Using Smartphones
