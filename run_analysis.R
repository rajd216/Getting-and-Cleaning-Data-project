if(!file.exists("./hardata")){dir.create("./hardata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./hardata/harDataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./hardata/harDataset.zip", exdir="./hardata")

# Merging the training and the test sets to create one data set

# Reading train data:

xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading test data

xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading features
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#Assigning column names:

colnames(xtrain) <- features[,2] 
colnames(ytrain) <-"activityId"
colnames(subjecttrain) <- "subjectId"
      
colnames(xtest) <- features[,2] 
colnames(ytest) <- "activityId"
colnames(subjecttest) <- "subjectId"
      
colnames(activityLabels) <- c('activityId','activityType')

# Merging all data in one set:

mergetrain <- cbind(ytrain, subjecttrain, xtrain)
mergetest <- cbind(ytest, subjecttest, xtest)
setAllInOne <- rbind(mergetrain, mergetest)

# Extracting only the measurements on the mean and standard deviation for each measurement

colNames <- colnames(setAllInOne)

mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | 
                 grepl("mean.." , colNames) | grepl("std.." , colNames) )

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

# Using descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject

secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
