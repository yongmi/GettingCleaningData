Codebook
===================

Mean and standard deviation for measurements were extracted from 
"UCI HAR Dataset/train/X_train.txt" and "UCI HAR Dataset/test/X_test.txt"
based on variable names in "UCI HAR Dataset/features.txt"

Variables with *mean()* or *std()* in the name were considered to represent mean 
and standard deviation. Variables with *meanFreq()* in the name were not
included in the analysis, as they were defined as being "Weighted average of
the frequency components to obtain a mean frequency" and thus were specific to
frequency components.

Variable names were transformed using **make.names()** and **gsub** to change
them to valid R variable names. For example, variable name *tBodyAcc-mean()-X*
was transformed to *tBodyAcc.mean.X*. The intention was to retain as much as
possible the variable naming scheme used in the original data, so that those
familiar with the original data and its documentation could easily recognize
the renamed R variables.

## Variables in tidy data
* SID: unique identifier for subject. Ranges from 1 to 30.
* activity.NAME
+ WALKING
+ WALKING_UPSTAIRS
+ WALKING_DOWNSTAIRS
+ SITTING
+ STANDING
+ LAYING
* feature : takes on one of 66 values that are the variable names in intermediate merged file
+ tBodyAcc.mean.X
+ tBodyAcc.mean.Y
+ tBodyAcc.mean.Z
+ tBodyAcc.std.X
+ tBodyAcc.std.Y
+ tBodyAcc.std.Z
+ tGravityAcc.mean.X
+ tGravityAcc.mean.Y
+ tGravityAcc.mean.Z
+ tGravityAcc.std.X
+ tGravityAcc.std.Y
+ tGravityAcc.std.Z
+ tBodyAccJerk.mean.X
+ tBodyAccJerk.mean.Y
+ tBodyAccJerk.mean.Z
+ tBodyAccJerk.std.X
+ tBodyAccJerk.std.Y
+ tBodyAccJerk.std.Z
+ tBodyGyro.mean.X
+ tBodyGyro.mean.Y
+ tBodyGyro.mean.Z
+ tBodyGyro.std.X
+ tBodyGyro.std.Y
+ tBodyGyro.std.Z
+ tBodyGyroJerk.mean.X
+ tBodyGyroJerk.mean.Y
+ tBodyGyroJerk.mean.Z
+ tBodyGyroJerk.std.X
+ tBodyGyroJerk.std.Y
+ tBodyGyroJerk.std.Z
+ tBodyAccMag.mean..
+ tBodyAccMag.std..
+ tGravityAccMag.mean..
+ tGravityAccMag.std..
+ tBodyAccJerkMag.mean..
+ tBodyAccJerkMag.std..
+ tBodyGyroMag.mean..
+ tBodyGyroMag.std..
+ tBodyGyroJerkMag.mean..
+ tBodyGyroJerkMag.std..
+ fBodyAcc.mean.X
+ fBodyAcc.mean.Y
+ fBodyAcc.mean.Z
+ fBodyAcc.std.X
+ fBodyAcc.std.Y
+ fBodyAcc.std.Z
+ fBodyAccJerk.mean.X
+ fBodyAccJerk.mean.Y
+ fBodyAccJerk.mean.Z
+ fBodyAccJerk.std.X
+ fBodyAccJerk.std.Y
+ fBodyAccJerk.std.Z
+ fBodyGyro.mean.X
+ fBodyGyro.mean.Y
+ fBodyGyro.mean.Z
+ fBodyGyro.std.X
+ fBodyGyro.std.Y
+ fBodyGyro.std.Z
+ fBodyAccMag.mean..
+ fBodyAccMag.std..
+ fBodyBodyAccJerkMag.mean..
+ fBodyBodyAccJerkMag.std..
+ fBodyBodyGyroMag.mean..
+ fBodyBodyGyroMag.std..
+ fBodyBodyGyroJerkMag.mean..
+ fBodyBodyGyroJerkMag.std..
* feature.mean : mean value of feature, for each subject and activity