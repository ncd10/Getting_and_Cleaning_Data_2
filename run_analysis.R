#note to grader, i'm not a native english speaker/writer. please forgive any spelling/Grammer mistakes. thx!

#this script joins together the subjects from the test and train files, 
#and extracts each variable that contains the words "mean" or"std".

#download files and unpack into working directory. 
#please remove # symbol and run the script if download is necessary
#dataurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(dataurl, "recognition_using_smartphones.zip")
#unzip("recognition_using_smartphones.zip")

require(dplyr)
##set working directory
setwd("./UCI HAR Dataset")

##read and merge train data
#y train data - read file, and rename variable.
y_train<-read.table("./train/y_train.txt")
y_train$V1<-factor(y_train$V1,
                   labels=c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                            "SITTING","STANDING","LAYING" ))
names(y_train)<-"activity"
#subject file - read data, and rename variable
subject_train<-read.table("./train/subject_train.txt")
names(subject_train)<-"subject"
#train set data: loading data, variable names (droping redandent
#cahrecters in variables name) and labeling
x_train<-read.table("./train/X_train.txt")
fea<-read.table("features.txt")
x_labels<-t(fea$V2)
x_labels <- make.names(names=x_labels, unique=TRUE, allow_ = TRUE)
x_labels<-gsub("..", "",x_labels, fixed=TRUE)
names(x_train)<-x_labels
#keeping only mean and std measurments
x_train<-select(x_train, contains("mean"), contains("std"))
#merging all train data
train_data<-cbind(subject_train, y_train, x_train)
#removing files not to be used any more
rm(fea, subject_train, x_train, y_train, x_labels)

##read and merge test data
#y labels
y_test<-read.table("./test/y_test.txt")
y_test$V1<-factor(y_test$V1,
                  labels=c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                           "SITTING","STANDING","LAYING" ))
names(y_test)<-"activity"
#subject file
subject_test<-read.table("./test/subject_test.txt")
names(subject_test)<-"subject"
#test set data: loading data and col names and labeling
x_test<-read.table("./test/X_test.txt")
fea<-read.table("features.txt")
x_labels<-t(fea$V2)
x_labels <- make.names(names=x_labels, unique=TRUE, allow_ = TRUE)
x_labels<-gsub("..", "",x_labels, fixed=TRUE)
names(x_test)<-x_labels
#keeping only mean and std measurments
x_test<-select(x_test, contains("mean"), contains("std"))
#merging all test data
test_data<-cbind(subject_test, y_test, x_test)
#removing files not to be used any more
rm(fea, subject_test, x_test, y_test, x_labels)

##merge test and training, removing files not to be used any more
data<-rbind(test_data, train_data)
rm(test_data, train_data)
names(data)<-tolower(names(data))

#creates mean_df data set with the average of each variable
#for each activity and each subject
data<-tbl_df(data)
mean_df<-data%>%group_by(subject, activity)%>%summarise_each(funs(mean))
View(mean_df)

#export mean_df to your working directory
#write.table(mean_df, file="mean_df.txt", row.names=FALSE)
