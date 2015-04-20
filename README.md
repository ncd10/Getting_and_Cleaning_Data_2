# Getting_and_Cleaning_Data_2
*note to grader, i'm not a native english speaker/writer. please forgive any spelling/Grammer mistakes. thx!*


this folder repo contains a R script file which prouduces two data sets from the UCI HAR datasets:
  1. *data*: data for all subjects on all mean or std measurments. the instruction for selecting variables to include in the dataset is rather open, so i took all varibles that had the string "mean" or "std" in their names. (see [http://goo.gl/PJ09uY] (http://goo.gl/PJ09uY) in question "what columns are measurements on the mean and standard deviation".  
  2. *mean_df*: a summarise table with average of each variable for each activity and each subject (total of 180 rows.
30 subject * 6 activities)

**note**: it is asumed that you have the UCI HAR datasets in your working directory. if not, please remove the "#" symbol
in the beginning of rows 7-10 in the "run_analysis.R" script to download and unzip. also, the last row writes the      "mean_df" file to the working directory. if you wish to use it, please remove "#" symbol from the beginning of row 77.

a *codebook* is submited in the directory further cllaryfing variables and variables names.

thank you!
