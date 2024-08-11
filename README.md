# r_stat_ort
The database chosen for this work is [*Udemy All Finance Accounting*](https://www.kaggle.com/datasets/jilkothari/finance-accounting-courses-udemy-13k-course), obtained from Kaggle. This database contains measured data from 13,608 items; each one correspond to different courses offered on the online learning platform, created in 2009, Udemy.    

The variables chosen for this work are *is_paid* as a qualitative variable and *num_subscribers* and *rating* as quantitative variables. These variables were selected to find if there is a correlation between them.    
The variable raw data in the excel file *Udemy All Finance Accounting* is analysed in R Studio to graphic them, analyse their frequencies, meassurements and other. Their script is separated between the following folders:   

*   [Analysis of *num_subscribers*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_num_s)
*   [Analysis of *is_plaid*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_is_p)  
*   [Analysis of *rating*](https://github.com/r41ss4/r_stat_ort/tree/main/analysis_rating)

In each folder, you can find a R script with the code to find different variable's metrics and graphics. It is complemented with a **.png** file showing the graphics results. 

Since the ultimate purpose is to demostrate if a correlation exists between *num_subscribers*, *rating* and *is_paid*, their is a finale analysis based on regressional analysis in a separate folder.

*Disclosure:* This project was created as the final asignment of Statistics in [ORT University, Uruguay](https://www.ort.edu.uy/) for a bachelor's degree of [International Studies](https://facs.ort.edu.uy/licenciatura-en-estudios-internacionales). Therefore, it is design only to merely implement descriptive statistics through R.