---
title: "Codebook"
date: "12.26.15"
---

## Project Description

The purpose of the project is to show ability to get, manipulate  and clean a data set.
As the row data are used the data collected from the devices embedded in the Samsung Galaxy S smartphones.
The goal is to prepare tidy data that can be used for further analysis. 

##Study design and data processing

###Collection of the raw data
30 volonteers between  19 and 48 years old were participating in collecting the original data. They wore a smartphone on the waist while performing certain actions (actvities)  . The data - 3-axial linear acceleration and 3-axial angular velocity -  were agglomerated from embedded axelerometer ("Acc"") and gyroscope ("Gyro").
Signals were split into gravitational("Gravity") or body ("Body")  motion components and jerk ("Jerk"). Signals are obtained in two domains: time ('t'-prefix)  and frequency ('f'-prefix). The magnitude of signals ("Mag") were calculated using the Euclidean norm. 
These signals are used as values of  561-vector of variables - features - such as tBodyAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag; and calculated from  these signals values of mean, standard deviation and other staatistical values.

###Notes on the original (raw) data 
Raw data are presented in separate files:

* 'activity_labels.txt': links activity label with its name
* 'train/X_train.txt': training set.
* 'train/y_train.txt': activity labels of the training set
* 'subject_train.txt': subject labels of the training set
* 'test/X_test.txt': test set.
* 'test/y_test.txt': activity labels of the test set
* 'subject_test.txt': subject labels of the test set

##Creating the tidy datafile

###Guide to create the tidy data file

1. Download data from 
'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
2. Merge the training and the test sets to create one data set.
3. Extract the measurements on the mean and standard deviation for each measurement. 
4. Name the activities in the data set with descriptive names. 
5. Label the data set descriptive variable names. 
6. From above data set  create an independent tidy data set with the average of each variable for each activity and each subject.

###Cleaning of the data

* Packages "dplyr" and "tidyr" have been used  In the process of cleaning the data 
* Download the data and create tables with read.table() function.
* Bind columns and rows of appropriate data.frames with cbind()  and rbind() functions.
* Extract variables on mean and standard deviation values with separate() and contains() functions.
* Excude magnitudes as calculated values with separate and -contains() functions. (These columns have different structure and can be used to create a separate tidy data set.)
* Any feature of the obtained data set contains five variables - domain, device, motion component, statistical value and direction.
* Split these columns and make the narrow data set with gather(),separate(), spread() and mutate() functions.
* Create a final tidy data set with group_by() and summarize() functions.

[README.md]()

##Description of the variables in the tidy_data.txt file

###General description of the file:


```
## [1] "Dimensions of the data set"
```

```
## [1] 4320    8
```

```
## [1] "Variables of the data set"
```

```
## [1] "domain"          "subjectid"       "activity"        "device"         
## [5] "motioncomponent" "direction"       "avgmean"         "avgstd"
```

```
## [1] "Summary of the data"
```

```
##        domain          subjectid                  activity  
##  frequency:1620   subject_1 : 144   laying            :720  
##  time     :2700   subject_10: 144   sitting           :720  
##                   subject_11: 144   standing          :720  
##                   subject_12: 144   walking           :720  
##                   subject_13: 144   walking_downstairs:720  
##                   subject_14: 144   walking_upstairs  :720  
##                   (Other)   :3456                           
##            device     motioncomponent direction    avgmean         
##  accelerometer:2700   body   :2160    X:1440    Min.   :-0.995250  
##  gyroscope    :1620   gravity: 540    Y:1440    1st Qu.:-0.392928  
##                       jerk   :1620    Z:1440    Median :-0.069655  
##                                                 Mean   :-0.198192  
##                                                 3rd Qu.: 0.007598  
##                                                 Max.   : 0.974509  
##                                                                    
##      avgstd       
##  Min.   :-0.9971  
##  1st Qu.:-0.9735  
##  Median :-0.9281  
##  Mean   :-0.6688  
##  3rd Qu.:-0.3660  
##  Max.   : 0.6871  
## 
```

```
## [1] "Structure of the tidy data"
```

```
## 'data.frame':	4320 obs. of  8 variables:
##  $ domain         : Factor w/ 2 levels "frequency","time": 1 1 1 1 1 1 1 1 1 1 ...
##  $ subjectid      : Factor w/ 30 levels "subject_1","subject_10",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ activity       : Factor w/ 6 levels "laying","sitting",..: 1 1 1 1 1 1 1 1 1 2 ...
##  $ device         : Factor w/ 2 levels "accelerometer",..: 1 1 1 1 1 1 2 2 2 1 ...
##  $ motioncomponent: Factor w/ 3 levels "body","gravity",..: 1 1 1 3 3 3 1 1 1 1 ...
##  $ direction      : Factor w/ 3 levels "X","Y","Z": 1 2 3 1 2 3 1 2 3 1 ...
##  $ avgmean        : num  -0.939 -0.867 -0.883 -0.957 -0.922 ...
##  $ avgstd         : num  -0.924 -0.834 -0.813 -0.964 -0.932 ...
```


###Variable 1 

 
 ```
 ## [1] "Name of variable 1"
 ```
 
 ```
 ## [1] "domain"
 ```
 
 ```
 ## [1] "Class of variable 1"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 1"
 ```
 
 ```
 ## [1] "frequency" "time"
 ```
 
 ```
 ## [1] "Structure and summary of variable 1"
 ```
 
 ```
 ## frequency      time 
 ##      1620      2700
 ```
 
 ```
 ##  Factor w/ 2 levels "frequency","time": 1 1 1 1 1 1 1 1 1 1 ...
 ```

####Notes on variable 1:
Variable 1 - "domain"" - was obtained from the first letter of feature name

###Variable 2 

 
 ```
 ## [1] "Name of variable 2"
 ```
 
 ```
 ## [1] "subjectid"
 ```
 
 ```
 ## [1] "Class of variable 2"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 2"
 ```
 
 ```
 ##  [1] "subject_1"  "subject_10" "subject_11" "subject_12" "subject_13"
 ##  [6] "subject_14" "subject_15" "subject_16" "subject_17" "subject_18"
 ## [11] "subject_19" "subject_2"  "subject_20" "subject_21" "subject_22"
 ## [16] "subject_23" "subject_24" "subject_25" "subject_26" "subject_27"
 ## [21] "subject_28" "subject_29" "subject_3"  "subject_30" "subject_4" 
 ## [26] "subject_5"  "subject_6"  "subject_7"  "subject_8"  "subject_9"
 ```
 
 ```
 ## [1] "Structure and summary of variable 2"
 ```
 
 ```
 ##  subject_1 subject_10 subject_11 subject_12 subject_13 subject_14 
 ##        144        144        144        144        144        144 
 ## subject_15 subject_16 subject_17 subject_18 subject_19  subject_2 
 ##        144        144        144        144        144        144 
 ## subject_20 subject_21 subject_22 subject_23 subject_24 subject_25 
 ##        144        144        144        144        144        144 
 ## subject_26 subject_27 subject_28 subject_29  subject_3 subject_30 
 ##        144        144        144        144        144        144 
 ##  subject_4  subject_5  subject_6  subject_7  subject_8  subject_9 
 ##        144        144        144        144        144        144
 ```
 
 ```
 ##  Factor w/ 30 levels "subject_1","subject_10",..: 1 1 1 1 1 1 1 1 1 1 ...
 ```

###Variable 3 

 
 ```
 ## [1] "Name of variable 3"
 ```
 
 ```
 ## [1] "activity"
 ```
 
 ```
 ## [1] "Class of variable 3"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 3"
 ```
 
 ```
 ## [1] "laying"             "sitting"            "standing"          
 ## [4] "walking"            "walking_downstairs" "walking_upstairs"
 ```
 
 ```
 ## [1] "Structure and summary of variable 3"
 ```
 
 ```
 ##             laying            sitting           standing 
 ##                720                720                720 
 ##            walking walking_downstairs   walking_upstairs 
 ##                720                720                720
 ```
 
 ```
 ##  Factor w/ 6 levels "laying","sitting",..: 1 1 1 1 1 1 1 1 1 2 ...
 ```

###Variable 4 

 
 ```
 ## [1] "Name of variable 4"
 ```
 
 ```
 ## [1] "device"
 ```
 
 ```
 ## [1] "Class of variable 4"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 4"
 ```
 
 ```
 ## [1] "accelerometer" "gyroscope"
 ```
 
 ```
 ## [1] "Structure and summary of variable 4"
 ```
 
 ```
 ## accelerometer     gyroscope 
 ##          2700          1620
 ```
 
 ```
 ##  Factor w/ 2 levels "accelerometer",..: 1 1 1 1 1 1 2 2 2 1 ...
 ```

####Notes on variable 4
The type of an embedded device is presented as "Gyro" or "Acc" substring in feature name.


###Variable 5 

 
 ```
 ## [1] "Name of variable 5"
 ```
 
 ```
 ## [1] "motioncomponent"
 ```
 
 ```
 ## [1] "Class  of variable 5"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 5"
 ```
 
 ```
 ## [1] "body"    "gravity" "jerk"
 ```
 
 ```
 ## [1] "Structure and summary of variable 5"
 ```
 
 ```
 ##    body gravity    jerk 
 ##    2160     540    1620
 ```
 
 ```
 ##  Factor w/ 3 levels "body","gravity",..: 1 1 1 3 3 3 1 1 1 1 ...
 ```

####Notes on variable 5:
The motion component is presented as "Body", "Gravity" or "Jerk" substring in feature name.


###Variable 6 

 
 ```
 ## [1] "Name of variable 6"
 ```
 
 ```
 ## [1] "direction"
 ```
 
 ```
 ## [1] "Class  of variable 6"
 ```
 
 ```
 ## [1] "factor"
 ```
 
 ```
 ## [1] "Unique values/levels of the variable 6"
 ```
 
 ```
 ## [1] "X" "Y" "Z"
 ```
 
 ```
 ## [1] "Structure and summary of variable 6"
 ```
 
 ```
 ##    X    Y    Z 
 ## 1440 1440 1440
 ```
 
 ```
 ##  Factor w/ 3 levels "X","Y","Z": 1 2 3 1 2 3 1 2 3 1 ...
 ```

####Notes on variable 5:
The direction is presented as "-X-" ,"-Y-" or "-Z-"  suffix in feature name.


###Variable 7 

 
 ```
 ## [1] "Name of variable 7"
 ```
 
 ```
 ## [1] "avgmean"
 ```
 
 ```
 ## [1] "Class  of variable 7"
 ```
 
 ```
 ## [1] "numeric"
 ```
 
 ```
 ## [1] "Structure and summary of variable 7"
 ```
 
 ```
 ##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
 ## -0.995200 -0.392900 -0.069660 -0.198200  0.007598  0.974500
 ```
 
 ```
 ##  num [1:4320] -0.939 -0.867 -0.883 -0.957 -0.922 ...
 ```

###Variable 8 

 
 ```
 ## [1] "Name of variable 8"
 ```
 
 ```
 ## [1] "avgstd"
 ```
 
 ```
 ## [1] "Class  of variable 8"
 ```
 
 ```
 ## [1] "numeric"
 ```
 
 ```
 ## [1] "Structure and summary of variable 8"
 ```
 
 ```
 ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 ## -0.9971 -0.9735 -0.9281 -0.6688 -0.3660  0.6871
 ```
 
 ```
 ##  num [1:4320] -0.924 -0.834 -0.813 -0.964 -0.932 ...
 ```

