Getting-and-Cleaning-Data
=========================


The provided script first downloads the 8 data tables below from the working directory.
Analysis of unique subjects and their activities are conducted by combining the test data with the train data.

Below are the numbered file paths: 
1. "features.txt"
2. "train\\X_train.txt"
3. "train\\Y_train.txt"
4. "train\\subject_train.txt"
5. "test\\X_test.txt"
6. "test\\Y_test.txt"
7. "test\\subject_test.txt"
8.  "activity_labels.txt"

Data transformation steps:

The data are combined with cbind (2+4+3) and (5+7+6) and then rbind(ed) together.

The (1) and "Subject" and "Activty" are rbind(ed) and used for creating the colnames. 


The columns are culled out to only be related to "mean" or "std" variables.  

Activity code #s are replaced with "Activity_Name" merging the labels provided in (8)

Finally, a Tidy data set shows all subject and activity name combinations and the associated average value for each variable.
This was done using melt, then dcast.
 