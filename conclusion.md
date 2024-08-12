# Conclusions
## Interpresation of variables relation 
The analysis of the variables provides information on the heterogeneity of the data collected on a quantitative variable.    

The sample variance is an approximation of the average of the squared deviations of each data to the sample mean. The variance considers the value of all the observed data to account for its variability, expressing its result in the unit of measurement of the squared variable.    

This is why the standard deviation is a better indicator of the dispersion of the data since to calculate it not only are all the observed values ​​used but its result is expressed in the same unit of measurement as the original data. The standard deviation is the positive square root of the variance.    

The coefficient of variation indicates how large the standard deviation is from the mean, usually expressed as a percentage. The coefficient of variation does not have an associated unit of measurement, thanks to this, it can be used instead of the standard deviation, to compare the variation of data that has different units.   

The “rating” variable presents greater variance than the *num_subscribers* variable; The greater its variance, the greater the dispersion of its data. Moreover, the *rating* variable has a greater standard deviation than the *num_subscribers* variable, so a higher standard deviation value implies that there is a greater dispersion of the data with respect to the mean.     

Finally, the *rating* variable has a higher coefficient of variation than the *num_subscribers* variable, so the dispersion in its data will be greater. From the comparison of these three dispersion measures for both quantitative variables. It is possible to conclude that the data of the *rating* variable is more dispersed than the data of the *num_subscribers* variable.

## Regression Analysis
Between the quantitative variables “rating” and “num_subscribers”

*   The linear correlation coefficient is: 0.1000112.   
*   The Pearson coefficient is: 0.00000000000000022.    

The correlation indicates the sign and magnitude of the trend between the two variables under study. There is a positive correlation between both variables, that is, when “rating” increases, “num_subscribers” increases. A positive value of the correlation coefficient indicates a direct or positive relationship.    

The sign indicates the direction of the relationship, showing it corresponding to the scatter diagram, so if the correlation is positive, the scatter diagram will show a positive correlation.   

The magnitude indicates the strength of the relationship, and can take values ​​between -1 and 1. The closer the value is to the extremes of the interval, that is, to 1 or -1, the stronger the trend of the variables, and therefore Therefore, the dispersion between the points in the scatterplot for the trend will be smaller. On the contrary, the closer the correlation coefficient is to 0, the weaker the trend will be, that is, the more dispersion there will be. The correlation that exists between the variables “rating” and “num_subscribers” is low or weak, since the value of the linear correlation coefficient is between 0 and 0.3.   

We also find that the coefficient of determination (r2) is worth 0.01. The coefficient of determination is a measure of the goodness of fit of the estimated regression equation to the sample data that is based on the decomposition of the total sum of squares. From its definition it follows that 0 ≤ r2 ≤ 1.   

In this case, r2 has a value of 0.01, which means that it is very close to 0. If r2 had a value of 0. It is possible to conclude that the variables are independent, that is, the intensity of the linear relationship is null. Since r2 has its value between 0 < r2 ≤ 0.3, the intensity of the linear relationship is weak, but not zero.

## Final insights

Throughout the work, we carried out a study of the [*Udemy All Finance Accounting*](https://www.kaggle.com/datasets/jilkothari/finance-accounting-courses-udemy-13k-course) database in order to carry out a descriptive analysis of three of its variables and study their correlation. The correlations we studied were: the correlation between the “num_subscribers” score and *rating* (correlation between quantitative variables); and the correlation between *is_paid* and *num_subscribers* (correlation between categorical variable and quantitative variable).    

On the one hand, regarding the correlation between the quantitative variables, the regression analysis and the creation of the scatter diagram allowed us to see a positive correlation between the quantitative variables *rating* and *num_subscribers*. It is possible conclude that the correlation between both variables is weak, which means that a weak increase in the number of subscribers can be noticed as the rating of the courses increases.     

On the other hand, based on the association analysis of the categorical variable *is_paid* and the quantitative variable *num_subscribers*, by creating a frequency table, a grouped bar graph and a table of percentages, it is possible to identify that There is a positive proportional relationship between the categorical variable 'is_paid' and the quantitative variable 'num_subscribers'. The correlation between these variables is concluded positive after discovering that, as the number of subscribers increases, there is a predominance of the **TRUE** category (paid courses) over the **FALSE** category (non-paid courses).   

This analysis focuses on studying the correlation of the quantitative variable 'num_subscribers' with a quantitative variable *rating* and another qualitative variable *is_paid*, being able to appreciate how this has a positive correlation with both.