# Getting and Cleaning Data
# Course Project
# 2014-12-18

setwd("~/Documents/Coursera/DataScienceTrack/GettingCleaningData/CourseProject/GettingCleaningData")

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(dplyr)
library(stringr)
library(reshape)

features<-read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
actnames<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, col.names=c("activity", "activity.NAME"))
colnames(features) <- c("fid", "fname")
myfeatures<-filter(features, str_detect(fname,"mean\\(|std\\("))

subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("SID"))
trainset <- read.table("UCI HAR Dataset/train/X_train.txt")
acts <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))

trainset2 <- trainset[myfeatures$fid]
traincombo <- cbind(subject, acts, trainset2)
traincombo2 <- inner_join(traincombo, actnames)

subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("SID"))
testset <- read.table("UCI HAR Dataset/test/X_test.txt")
acts <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))

testset2 <- testset[myfeatures$fid]
testcombo <- cbind(subject, acts, testset2)
testcombo2 <- inner_join(testcombo, actnames)

combo = rbind(traincombo2, testcombo2)
combo$activity <- NULL

myfeatures$feature.NAME <- make.names(myfeatures$fname)
myfeatures$feature.NAME <- gsub("[[:punct:]]{3}", ".", myfeatures$feature.NAME)
names(combo)[2:67] <- myfeatures$feature.NAME

combo2 <- melt(combo, id=c("SID","activity.NAME"))
combo2<-rename(combo2, c(variable="feature"))
subjects <- group_by(combo2, SID, activity.NAME, feature)
allmeans <- summarise(subjects, feature.mean=mean(value))

write.table(allmeans, file = "tidydata.txt", row.name=FALSE)