---
date: "12.26.15"

---

## PRoject Description

The purpose of the project is to show ability to get, manipulate  and clean a data set.
The goal is to prepare tidy data that can be used for further analysis. 
The raw data have been processed using packages dplyr and tidyr.

## Script Description

* Packages "dplyr" and "tidyr" have been used  In the process of cleaning the data 
* Download the data and create tables with read.table() function.
* Bind columns and rows of appropriate data.frames with cbind()  and rbind() functions.
* Create temp feature's names for futher extraction mean and std. This name contains feature# and its name.
* Extract variables on mean and standard deviation values with separate() and contains() functions.
* Excude magnitudes as calculated values with separate and -contains() functions. These variables have different structure and can be used to create a separate tidy data set.
* Convert subject id to string and make it descriptive
* Any extracted feature contains five variables - domain, device, motion component, statistical value and direction.
* Extract temp names of the features that include feature# to get rid of numeric prefix in a feature name
* Separate the first letter that denotes domain to use in for creation new variable "domain"
* Add a column of row# to help with futher spreading  measurements on the mean and on the std
* Gather the feature name (key) and measurements (value) into the rows with gather()
* Separate the feature names into four columns: domain, reading, stat and direction with separate()
* Turn value of "stat" column - "mean" and "std"- into new columns with spread()
* Distiguish the rows between accelerometer- and gyroscope- received measurements with grepl() and create a vector that contains these values
* Distiguish the rows in regard to their motion component and create a vector
* Name the activities in the data set using their labels from the file "activity_labels.txt"
* Add the columns for "device"" and "motioncomponent" variables and assign them the above vectors appropriately with mutate()
* Convert the string variables to the factor ones
* Create a final tidy data set with group_by() and summarize() functions
