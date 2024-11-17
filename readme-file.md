# Getting and Cleaning Data Course Project

## Project Overview
This repository contains the course project for the "Getting and Cleaning Data" course on Coursera. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The final output is a tidy data set that can be used for later analysis.

## Project Files
* `run_analysis.R`: The script that performs the data collection and cleaning
* `CodeBook.md`: Description of the variables, data, and transformations
* `tidy_data.txt`: The final processed dataset (output of the script)

## How the Script Works
The `run_analysis.R` script performs the following operations:

1. Downloads and unzips the dataset if it doesn't exist in the working directory
2. Loads both training and test datasets
3. Loads feature and activity info
4. Merges the training and test datasets
5. Extracts only mean and standard deviation measurements
6. Uses descriptive activity names
7. Labels the data set with descriptive variable names
8. Creates a tidy dataset with the average of each variable for each activity and subject
9. Writes the tidy dataset to `tidy_data.txt`

## Running the Analysis
1. Clone this repository
2. Open R/RStudio and set your working directory to the repository location
3. Run `source("run_analysis.R")`
4. The tidy dataset will be created in your working directory as `tidy_data.txt`

## Dependencies
The script requires the `dplyr` and `tidyr` packages. Install them using:
```R
install.packages("dplyr")
install.packages("tidyr")
```
