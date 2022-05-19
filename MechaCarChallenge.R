
### CHALLENGE 15

### Deliverable 1

#load packages
library(dplyr)
library(tidyverse)

#Import and read the csv file
mecha_car <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

#Perform linear regression using the lm() function
mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_car)

#Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(mecha_lm)


### DELIVERABLE 2

#Import and read the csv file
suspen_coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#Create a total_summary data frame using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <-  suspen_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#Create a lot_summary data frame using the group_by() and the summarize() functions to group each manufacturing lot.
lot_summary <- suspen_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
