#### Getting and Cleaning Data - Course project
*note to grader, i'm not a native english speaker/writer. please forgive any spelling/Grammer mistakes. thx!*

this repo contains a R script file which prouduces a tidy dataset (observations are in rows and variables are in columns) from the UCI HAR datasets, named *mean_df*. this ia a summarise table with average of each variable for each activity and each subject (30 subject * 6 activities= total of 180 rows). **this file is the one submited**.

the instruction for selecting variables to include in the dataset is rather open, so i took all varibles that had the string "mean" or "std" in their names. (see [http://goo.gl/PJ09uY] (http://goo.gl/PJ09uY) in question "what columns are measurements on the mean and standard deviation".)  

**note**: it is asumed that you have the UCI HAR datasets in your working directory. if not, please remove the "#" symbol
in the beginning of rows 7-10 in the "run_analysis.R" script to download and unzip. also, the last row writes the      "mean_df" file to the working directory. if you wish to use it, please remove "#" symbol from the beginning of row 77.

a *codebook* is submited in the directory further cllaryfing variables and variables names.

thank you!

**appendix**: the main stages that have been taken in generating the datasets:

1. download files and unpack into working directory.
2. set working directory.
3. read and merge train data.
  * y train data - read file, and rename variable.
  * subject file - read data, and rename variable.
  * train set data: loading data, variable names (droping redandent cahrecters in variables name) and labeling.
  * keeping only mean and std measurments.
  * merging all train data.
  * removing files not to be used any more.
4. read and merge test data (same steps as in train data).
5. merge test and training, removing files not to be used any more.
6. creates "mean_df" data set with the average of each variable for each activity and each subject.
7. export mean_df to your working directory.
