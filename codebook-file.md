# Code Book

## Data Source
The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Set Information
The experiments were carried out with a group of 30 volunteers aged 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on their waist.

## Variables in Tidy Dataset

### Identifiers
* `subject` - Test subject ID (1-30)
* `activity` - Type of activity performed

### Activity Labels
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Measurements
All measurements are floating-point values, normalized and bounded within [-1,1].
The measurements are classified in two domains:

Time-domain signals (prefix: 'time'), captured at a constant rate of 50 Hz:
* timeBodyAccelerometerMean-XYZ
* timeBodyAccelerometerStd-XYZ
* timeGravityAccelerometerMean-XYZ
* timeGravityAccelerometerStd-XYZ
* timeBodyAccelerometerJerkMean-XYZ
* timeBodyAccelerometerJerkStd-XYZ
* timeBodyGyroscopeMean-XYZ
* timeBodyGyroscopeStd-XYZ
* timeBodyGyroscopeJerkMean-XYZ
* timeBodyGyroscopeJerkStd-XYZ
* timeBodyAccelerometerMagnitudeMean
* timeBodyAccelerometerMagnitudeStd
* timeGravityAccelerometerMagnitudeMean
* timeGravityAccelerometerMagnitudeStd
* timeBodyAccelerometerJerkMagnitudeMean
* timeBodyAccelerometerJerkMagnitudeStd
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeMagnitudeStd
* timeBodyGyroscopeJerkMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeStd

Frequency-domain signals (prefix: 'frequency'):
* frequencyBodyAccelerometerMean-XYZ
* frequencyBodyAccelerometerStd-XYZ
* frequencyBodyAccelerometerJerkMean-XYZ
* frequencyBodyAccelerometerJerkStd-XYZ
* frequencyBodyGyroscopeMean-XYZ
* frequencyBodyGyroscopeStd-XYZ
* frequencyBodyAccelerometerMagnitudeMean
* frequencyBodyAccelerometerMagnitudeStd
* frequencyBodyAccelerometerJerkMagnitudeMean
* frequencyBodyAccelerometerJerkMagnitudeStd
* frequencyBodyGyroscopeMagnitudeMean
* frequencyBodyGyroscopeMagnitudeStd
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeStd

Note: '-XYZ' denotes three separate measurements for X, Y, and Z axes.

## Transformations
1. Training and test sets were merged
2. Only mean and standard deviation measurements were extracted
3. Descriptive activity names were used
4. Variables were labeled with descriptive names
5. Final data set contains average of each variable for each activity and subject
