run_analysis.R
===================

The script run_analysis.R reads data from the UCI HAR Dataset and then generates
a tidy data text file that meets the principles of tidy data as presented in
Hadley Wickham's paper (http://vita.had.co.nz/papers/tidy-data.html).

The script requires the folder with the dataset to be in the same directory as
the script. The script outputs a text file in long format (refer to the codebook,
CodeBook.md, for more detailed information on the variables, the data, and
transformations performed to clean up the data). Files must be readable using
read.table().

The script initially merges three types of data:
* text file identifying sbuject who performed the activity for each window sample.
Its range is from 1 to 30.
* text file with 561 columns and a row for each activity for each window sample.
* text file with the activity label for each activity for each window sample.

The merge requires additional files, one with a list of all the features, and
another linking the activity labels with the activity name.

As the HAR Dataset comes split into training and test data, these two types of data
are combined into one file after each undergoes the merge described above. The
combined data file is then changed into long format, from which the average of 
each variable for each activity and each subject is computed. The results are 
saved into the same directory as the script using write.table().