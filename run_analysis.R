# run_analysis.R
# Script to clean and analyze Samsung Galaxy S accelerometer data

# Load required libraries
library(dplyr)
library(tidyr)

# Function to download and unzip the dataset if it doesn't exist
download_dataset <- function() {
  if (!file.exists("UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "dataset.zip")
    unzip("dataset.zip")
  }
}

# 1. Merge training and test sets
merge_datasets <- function() {
  # Read training data
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  # Read test data
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  # Combine training and test sets
  X_data <- rbind(X_train, X_test)
  y_data <- rbind(y_train, y_test)
  subject_data <- rbind(subject_train, subject_test)
  
  # Read feature names and activity labels
  features <- read.table("UCI HAR Dataset/features.txt")
  
  # Name the columns
  colnames(X_data) <- features$V2
  colnames(y_data) <- "activity"
  colnames(subject_data) <- "subject"
  
  # Combine all data
  combined_data <- cbind(subject_data, y_data, X_data)
  return(combined_data)
}

# 2. Extract mean and standard deviation measurements
extract_mean_std <- function(data) {
  # Find columns containing mean() or std()
  mean_std_cols <- grep("mean\\(\\)|std\\(\\)", colnames(data), value = TRUE)
  # Select subject, activity, and mean/std columns
  selected_data <- data %>%
    select(subject, activity, all_of(mean_std_cols))
  return(selected_data)
}

# 3. Use descriptive activity names
add_activity_names <- function(data) {
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                                col.names = c("activity", "activity_name"))
  
  data_with_activities <- data %>%
    left_join(activity_labels, by = "activity") %>%
    select(-activity) %>%
    rename(activity = activity_name)
  
  return(data_with_activities)
}

# 4. Label dataset with descriptive variable names
clean_variable_names <- function(data) {
  names(data) <- gsub("^t", "time", names(data))
  names(data) <- gsub("^f", "frequency", names(data))
  names(data) <- gsub("Acc", "Accelerometer", names(data))
  names(data) <- gsub("Gyro", "Gyroscope", names(data))
  names(data) <- gsub("Mag", "Magnitude", names(data))
  names(data) <- gsub("mean\\(\\)", "Mean", names(data))
  names(data) <- gsub("std\\(\\)", "Std", names(data))
  names(data) <- gsub("-", "", names(data))
  return(data)
}

# 5. Create tidy dataset with averages
create_tidy_averages <- function(data) {
  tidy_data <- data %>%
    group_by(subject, activity) %>%
    summarise(across(everything(), mean)) %>%
    ungroup()
  return(tidy_data)
}

# Main execution
main <- function() {
  # Download and unzip data
  download_dataset()
  
  # Execute all steps
  data <- merge_datasets()
  data <- extract_mean_std(data)
  data <- add_activity_names(data)
  data <- clean_variable_names(data)
  tidy_data <- create_tidy_averages(data)
  
  # Write the tidy dataset to a file
  write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
  
  return(tidy_data)
}

# Run the analysis
tidy_data <- main()
tidy_data
