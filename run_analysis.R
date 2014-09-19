#set directory to downloaded and unzipped folder
setwd("C:\\Users\\Owner\\Documents\\R\\UCI HAR Dataset")

#load each table
features <-read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)
trainx <-read.table("train\\X_train.txt", header=FALSE)
trainy <-read.table("train\\Y_train.txt", header=FALSE, stringsAsFactors=FALSE)
trains <-read.table("train\\subject_train.txt", header=FALSE)
testx <-read.table("test\\X_test.txt", header=FALSE)
testy <-read.table("test\\Y_test.txt", header=FALSE, stringsAsFactors=FALSE)
tests <-read.table("test\\subject_test.txt", header=FALSE)
activity <-read.table("activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)

#combine data to one big table
train <-cbind(trainx, trains, trainy)
test <-cbind(testx, tests, testy)
data <-rbind(train, test)

#create column names from features
features2 <- rbind(features, c(562, "Subject"), c(563, "Activity"))
features3 <-features2[,2]
colnames(data) <-features3

#subset the columns to be mean and std measurements only
filter1 <-grep("mean",features3)
filter2 <-grep("std",features3)
data2 <-data[,c(filter1,filter2, 562, 563)]

#change activity codes to be the names
colnames(activity) <- c("Activity","Activity_Name")
data3 <-merge(data2, activity, by="Activity")
data4 <-data3[,-data3$Activity]

#create tidy data summary of mean by subject and activity and write to file
library(reshape2)
data5 <-melt(data4, id=c("Subject", "Activity_Name"), measure.vars=c(1:74))
datatidy <-dcast(data5, Subject + Activity_Name ~ variable, mean)
write.table(datatidy, file="problem5tidydata.txt",row.name=FALSE)