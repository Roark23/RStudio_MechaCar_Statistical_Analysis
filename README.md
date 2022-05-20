# RStudio_MechaCar_Statistical_Analysis
## Purpose and Overview

The purpose of this project is to perform statistical testing in the programming language R for MechaCar car company. Performing various statistical tests can provide data-driven insight on the company's performance. To develop this insight for MechaCar, I will complete the following analysis:

- Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
- Run t-tests to determine if the manufacturing lots are statistically different from the mean population
- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, you’ll write a summary interpretation of the findings.

First, I created a multiple linear regression model to identify which variables (vehicle weight, spoiler angle, ground clearance, AWD and vehicle length in our case) in the dataset predict the mpg of MechaCar prototypes. Essentially, I am trying to find out if there is a relationship between the variables and mpg of MechaCar prototypes.

For a multiple linear regression model, we are establishing the following hypothesis:

H0 (Null Hypothesis): The slope of the linear model is zero (m = 0).

If there is no significant linear relationship, each dependent value would be determined by random chance and error. Therefore, our linear model would be a flat line with a slope of 0.

Ha (Alternative Hypothesis): The slope of the linear model is not zero (m ≠ 0).

We are testing if there is a significant linear relationship. If so, each dependent value would not be determined by random chance and error. Therefore, our linear model would not be a flat line with a slope other than 0.

## Multiple Linear Regression to Predict MPG

After running a multiple linear regression in R, we can determine how well the linear model predicts the mpg of MechaCar prototypes. Here is the statistical summary:

![Multiple_Linear_Regression_Output](/Images/linear_regression.png)

For every 1 unit increase, we can reasonably expect MPG to affect the other variables accordingly:

mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.0688)spoiler_angle + (3.546)ground_clearance + (-3.411)AWD + (-104.0)

#### Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

To determine which variables provide a non-random amount of variance to the mpg value, we have to analyze their individual p-values. For reference, a p-value below 0.05 is statistically unlikely to provide random amounts of variance to the linear model. this indicates that those variables have a significant impact on mpg.

When looking at the statistical summary bove, it is evident that ground clearance (p-value = 5.21 x 10-8), vehicle length (p-value = 2.60 x 10-12), as well as intercept (p-value = 5.08 x 10-8) provided a non-random amount of variance to the mpg values in the dataset. When an intercept is statistically significant, this means there are other variables and factors that contribute to the variation in mpg that have not been included in the model. These variables may or may not be within our dataset and may still need to be collected or observed.

#### Is the slope of the linear model considered to be zero? Why or why not?

The statistical summary located above indicates the p-value is 5.35 x 10-11, which is much smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis. That indicates the slope of our linear model is not zero, meaning that there is significant linear relationship between variables and mpg of MechaCar prototype.

#### Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

Based on our multiple linear regression model, we can predict the mog of the MechaCar prototypes:

mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.0688)spoiler_angle + (3.546)ground_clearance + (-3.411)AWD + (-104.0)

However, how effectively does our model predict mpg of MechaCar prototypes? We need look at its r-squared and p-value. R-Squared (R² or the coefficient of determination) is a statistical measure in every regression model that determines the proportion of variance in the dependent variable that can be explained by the independent variable. In other words, r-squared shows how well the data fit the regression model (the goodness of fit). 

The r-squared is 0.7149 and indicates a strong positive linear relationship. Approximately 71% of the variability observed can be explained by this model. The higher the R-square, the more accurate the model explains the data. Relatively speaking, this linear model effectively predicts the mpg of MechaCar prototypes, but there are other variables affecting mpg that our dataset may not account for.

## Summary Statistics on Suspension Coils

The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. Using R, I have created a summary statistics table to show:

- The suspension coil’s PSI continuous variable across all manufacturing lots:

![All_Lots_Summary](/Images/total_summary.png)

- The following PSI metrics for each lot: mean, median, variance, and standard deviation:

![Each_Lot_Summary](/Images/lot_summary.png)

#### Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. When looking at the entire population of the production lots, the variance of the coils is 62.29 PSI. This is well within the 100 PSI variance requirement.

Moreover, Lot 1 and Lot 2 are well within the 100 PSI variance requirement (with variances of 0.98 and 7.47 respectively). However, Lot 3 is showing a much larger variance in performance and consistency, with a variance of 170.29. Lot 3 is disproportionately causing the variance at the full lot level and should indicate further analysis to better understand why Lot 3 is so much different when compared to the other 2 lots.

## T-Tests on Suspension Coils

I performed one-sample t-test to determine whether there is a statistical difference between the means of a sample dataset (suspension coil data set) and a population dataset with the given mean of 1,500 PSI. Using a t-test, I have established the following hypotheses:

H0: There is no statistical difference between the suspension coil data set mean and its presumed population mean of 1,500 PSI.

Ha: There is statistical difference between the suspension coil data set mean and its presumed population mean of 1,500 PSI.

![T_Test_All_Lots](/Images/T_test_all_lots.png)

In order to reject or fail to reject our null hypothesis, we have to look at the p-value that determines if there is a statistical difference between the observed sample mean and its presumed population mean. Looking at the t test above, we can see the mean of the sample is 1498.78, which confirms what we observed in the summary statistics above. 

With a p-value of 0.06, which is higher than the common significance level of 0.05, there is not enough evidence to support rejecting the null hypothesis. Therefore, the mean of all three of these manufacturing lots is statistically similar to the presumed population mean of 1500.

![T_Test_Lot_1](/Images/T_test_lot_1.png)

When looking at the individual lots, lot 1 has the same sample as the true sample mean of 1500. With a p-Value of 1, clearly we cannot reject the null hypothesis that there is no statistical difference between the observed sample mean and the presumed population mean (1500).


![T_Test_Lot_2](/Images/T_test_lot_2.png)

Similar to Lot 1, lot 2 has essentially the same outcome with a sample mean of 1500.02 and a p-Value of 0.61. Therefore, the null hypothesis cannot be rejected, and the sample mean and population mean of 1500 are statistically similar.


![T_Test_Lot_3](/Images/T_test_lot_3.png)

However, Lot 3, not surprisingly differs from the other 2 lots. Here, we can see the sample mean is 1496.14 and the p-Value is 0.04, which is lower than the common significance level of 0.05. All lots indicate to reject the null hypothesis that this sample mean and the presumed population mean are not statistically different.

## Designing a Study Comparing MechaCar to its competition 

#### What metric or metrics are you going to test?

We could perform a study testing the horse power of MechaCar prototypes adn compare it to its competitors.  I would suggest testing for the following metrics to compare MechaCar against its competition: a comparison of a single dependent variable being horse power with multiple independent variables such as, acceleration, engine, fuel intake and overall top speed. These various independent variables could all have some sort of affect on horse power, and we would need to run a linear regression to better understand the impact these independent variables have on horse power.

#### What is the null hypothesis or alternative hypothesis?

To compare MechaCar's horse power with it's competition, we need to set up the following hypotheses:

H0: The average horse power for all groups is equal.

Ha: At least one of the metrics affects the horse power Mecha car statiscally differnt from all other groups.

#### What statistical test would you use to test the hypothesis? And why?

To test our hypothesis, a multiple linear regression could be used to determine the factors that have the highest correlation/predictability of horse power (dependent variable); which combination has the greatest impact on horse power.

We could also use a one-way ANOVA (Analysis of Variance) test. ANOVA is used to test the means of a single dependent variable across a single independent variable with multiple groups. For our analysis, horse power could differ based on a single independent variable like acceleration. We don't know the impact of each of these independent variables so conducting an ANOVA test with each one could porve to be incredibly useful. If we reject the null hypothesis, we can conclude that at least one of these metrics statistically affects the horse power of a car.

#### What other data is needed to run the statistical test?
In order to run thesse statistical tests, we need the data from:

- various vehicles top speed
- various vehicles acceleration
- various vehicles engine type
- various vehicles fuel intake

It's crusical to remember the input data must be validated prior to using the statistical test:

- The dependent variable is numerical and continuous.
- The independent variables are categorical.
- The dependent variable is considered to be normally distributed.
- The variance among each group should be very similar.