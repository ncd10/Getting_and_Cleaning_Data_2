# Getting_and_Cleaning_Data_2
#note to grader, i'm not a native english speaker/writer. please forgive any spelling/Grammer mistakes. thx!


this folder repo contains a R script file which prouduces two data sets from the UCI HAR datasets:
  1. data: data for all subjects on all mean or std measurments. it wasn't clear rather weach variables we should use.
     so i took all varibles that had the string "mean" or "std" in their names.
  2. mean_df: a summarise table with average of each variable for each activity and each subject (total of 180 rows.
     30 subject * 6 activities)
     
  a codebook is submited in the directory further cllaryfing variables and variables names.
