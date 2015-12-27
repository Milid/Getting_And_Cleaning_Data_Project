run_analysis<-function(){
    library(dplyr)
    library(tidyr)
    
    ###download and read data
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "proj.zip")
    unzip("proj.zip")
    setwd("./UCI HAR Dataset")
    
    tst <- read.table("test/X_test.txt")         ## readings: test
    ytst <- read.table("test/y_test.txt")        ## activity: test
    stst <- read.table("test/subject_test.txt")  ## subject: test
    trn <- read.table("train/X_train.txt")       ## readings: train
    ytrn <- read.table("train/y_train.txt")      ## activity: train 
    strn <- read.table("train/subject_train.txt")## subject: test
    
    ###  bind columns with subject#, activity label and values of the test and training sets
    comptst <- cbind(stst,ytst,tst)              
    comptrn <- cbind(strn,ytrn,trn) 
    
    ### merge the train and the test sets 
    compdata <- rbind(comptrn,comptst)  
    
    ### read the vector of features
    names <- read.table("features.txt")         
    
    ### create temp feature's names for futher extraction mean and std
    names[,3] <- paste(as.character(names[,1]),"_",as.character(names[,2]))  
    
    names <- c("subjectid","activity",names[,3])  
    colnames(compdata) <- names
    comp_data <- tbl_df(compdata)
    
    ### extract the measurements on the mean and standard deviation for each measurement
    ### exclude the calculated values of the  magnitude 
    ### convert subject id to string and make it descriptive
    mydata <- comp_data%>%
        select(subjectid,activity, contains("mean()"), contains("std()"))%>%
        select(-contains("Mag"))%>%
        mutate(subjectid= sapply(comp_data$subjectid, function(x) paste("subject",x,sep="_")))
   
    
    ### extract temp names of the features to get rid of numeric prefix in a feature name
    ### separate the first letter that denotes domain
    newnames <- colnames(mydata)[3:length(colnames(mydata))]
    ch_names<- strsplit(newnames," _ ")
    ch_names<- sapply(ch_names, function(x) x[2])
    ch_names<- sapply(ch_names,function(x) paste(substr(x,1,1),substr(x,2,nchar(x)),sep="_"))
    ch_names<-as.vector(ch_names)
  
    names <- c("subjectid","activity",ch_names)
    colnames(mydata)<-names
 
    ### add a column of row# to help spread measurements on the mean and the std
    ### gather the feature name (key) and measurement (value) into the rows
    ### separate the feature names into four columns
    ### split "stat" column into "mean" and "std" columns
    mynewdata <- mydata%>%
        mutate(observid=1:nrow(mydata))%>%      #add column with row# (observation#)
        gather(domain_source_stat_axe, measur,-observid,-subjectid,-activity )%>%
        separate(domain_source_stat_axe,c("domain","reading","stat","direction"))%>%
        spread(stat,measur)
    

     mynewdata$domain[mynewdata$domain=="f"]="frequency"
     mynewdata$domain[mynewdata$domain=="t"]="time"

 
    ### distiguish the rows between accelerometer- and gyroscope- received measurements
    def_device = vector(mode = "character", length = nrow(mynewdata))
    def_device[grepl("Acc",mynewdata$reading)]= "accelerometer"
    def_device[grepl("Gyro",mynewdata$reading)] = "gyroscope"
    
    ### distiguish the rows in regard to their motion component 
    motion_comp = vector(mode = "character", length = nrow(mynewdata))
    motion_comp[grepl("Body",mynewdata$reading)]= "body"
    motion_comp[grepl("Jerk",mynewdata$reading)] = "jerk"
    motion_comp[grepl("Gravity",mynewdata$reading)] = "gravity"
 

    ### name the activities in the data set
    ### add the columns for device and motion component variables
    ### convert the string variables to the factor ones
    activ<-tolower(as.character(read.table("activity_labels.txt")[,2]))
    mynewdata <-mynewdata%>%
       mutate( subjectid = as.factor(subjectid), domain=as.factor(domain), 
               activity = as.factor(sapply(mynewdata[,"activity"],function(x) activ[x])),
               device = as.factor(def_device) ,motioncomponent = as.factor(motion_comp ),
               direction = as.factor(direction))%>%
        select(-reading, -observid)
    

      
    ### create a data set with the average of each variable for each activity and each subject
    res<-mynewdata %>% 
        group_by(domain,subjectid,activity, device, motioncomponent,direction) %>%
        summarize(avgmean=mean(mean),avgstd = mean(std))
        
#     print(res)

    
    ### create a text file
    "tidy_data.txt"<-tempfile() 
    write.table(res,"tidy_data.txt", sep = "\t", row.names =FALSE, col.names = TRUE)
    
    
}