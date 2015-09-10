tidy <- (function() { # avoid namespace pollution
    read <- function(path)  read.table(file.path('UCI HAR Dataset', path))
    concatr <- function(path1, path2) rbind(read(path1), read(path2)) # concat 2 tables one under another
    
    featureNames <- read('features.txt')[,2]
    selectedColumnNumbers <- grep("-(mean|std)\\(", featureNames) # find names of -mean() and -std()
    
    all_data <- concatr('train/X_train.txt', 'test/X_test.txt')
    names(all_data) <- gsub('[()]',"", featureNames) # clear names: remove parenthesis
    mean_and_std <- all_data[, selectedColumnNumbers]
    
    activityIDs <- concatr('train/y_train.txt', 'test/y_test.txt')[,1]
    activityLabels <- read('activity_labels.txt')[,2]
    namedActivities <- activityLabels[activityIDs]
    
    subjects <- concatr('train/subject_train.txt', 'test/subject_test.txt')[,1]
    
    data.frame(subject=subjects, activity=namedActivities, mean_and_std)
})()

(function(tidy) {
    library(plyr)
    tidyMeans <- ddply(tidy, colnames(tidy)[1:2], numcolwise(mean)) # group by 1,2 columns; mean for rest
    write.table(tidyMeans, "tidy_means.txt", row.names = FALSE, quote = FALSE)
})(tidy)