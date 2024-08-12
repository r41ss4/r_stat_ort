# About
The database chosen for this work is [*Udemy All Finance Accounting*](https://www.kaggle.com/datasets/jilkothari/finance-accounting-courses-udemy-13k-course), obtained from Kaggle. This database contains measured data from 13,608 items; each one correspond to different courses offered on the online learning platform, created in 2009, Udemy.    

The variables chosen for this work are *is_paid* as a qualitative variable and *num_subscribers* and *rating* as quantitative variables. These variables were selected to find if there is a correlation between them. 

The variable raw data in the excel file *Udemy All Finance Accounting* is analysed in R Studio to graphic them, analyse their frequencies, meassurements and other. Their script is separated between the following folders:   

*   [Analysis of *num_subscribers*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_num_s)
*   [Analysis of *is_plaid*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_is_p)  
*   [Analysis of *rating*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_rating)

In each folder, you can find a **.r** script with the code to find different variable's metrics and graphics. It is complemented with a **.png** file showing the graphics results. 

Since the objective of this work is to carry out a descriptive analysis *num_subscribers*, *rating* and *is_paid*, and study their correlation, there is a finale analysis based on regressional analysis in a separate folder.

*Disclosure:* This project was created as the final asignment of Statistics in [ORT University, Uruguay](https://www.ort.edu.uy/) for a bachelor's degree of [International Studies](https://facs.ort.edu.uy/licenciatura-en-estudios-internacionales). Therefore, it is design only to merely implement descriptive statistics through R.

## Selection of variables 
The variables chosen for this work are *is_paid*, as a categorical variable, *num_subscribers* and *rating* as quantitative variables. The study of these three variables will allow to find a clear correlation if existed, is why they are chosen over the other variables in the database. The chosen variables are defined below.     

Whether the course is paid or *is_paid* is a categorical variable with a nominal measurement scale. This means that *is_paid* does not have numerical values, but labels that, in this case, vary between the possibility of **TRUE** or **FALSE**. The variable confirms or denies whether the courses are paid and allows to classify the elements between those that are paid (**TRUE**) and those that are not paid (**FALSE**), therefore they are free.     

The number of subscribers or *num_subscribers* is a quantitative variable, since it has numerical values. Due to this characteristic, there is a wider range of math operations to use with this data. It should be noted that numerical data with decimals cannot be extracted from this variable. That is, it can only have integer values ​​- which is why it is discrete. Furthermore, there is absolute zero in this variable, which allows to perform more mathematical operations than if it were an interval measurement scale.    

The score or *rating* is the second quantitative variable choosen. This means that, like *num_subscribers*, it has a numerical value and, in addition, both have a ratio measurement scale. A substantial difference between both quantitative variables chosen is that the *rating* is continuous, so, where appropriate, the numerical values ​​can include numbers with decimals. This in *num_subscribers* is impossible, since the variable consists of a count of subscribers (people).    

## Folders and files
Each folder contains a **.r** script and **.png** files related to the graphics and tables that can be created based on the script. Each one can work independently, which means scripts calls for the libraries that are needed for each section. This project was done using [*R Studio*](https://rstudio-education.github.io/hopr/starting.html) as the preferable IDE to work with the scripts.    

Read the [*Conclusions*](https://github.com/r41ss4/r_stat_ort/blob/main/conclusion.md) file within this repository to learn the final thoughs of the analysis applied to the dataset. 
