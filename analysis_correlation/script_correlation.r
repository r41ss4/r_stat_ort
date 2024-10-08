# Correlation analysis measurements
# Covariances
cov_num_rating = cov(udemy_data$num_subscribers, udemy_data$rating)
cov_num_paid = cov(udemy_data$num_subscribers, udemy_data$is_paid)
cov_paid_rating = cov(udemy_data$is_paid, udemy_data$rating)

# Correlation
corr_num_rating = cor(udemy_data$num_subscribers, udemy_data$rating)
corr_num_paid = cor(udemy_data$num_subscribers, udemy_data$is_paid)
corr_paid_rating = cor(udemy_data$is_paid, udemy_data$rating)

# Regression
reg_num_rating = lm(udemy_data$num_subscribers~udemy_data$rating)
reg_num_paid = lm(udemy_data$num_subscribers~udemy_data$is_paid)
reg_paid_rating = lm(udemy_data$is_paid~udemy_data$rating)

# Verification with r2 (correlation square)
corr_num_rating^2

# Cross Tabulation
# Install necessary package
install.packages("gmodels")
# Call library
library(gmodels)
# Create the object for cross tabulation 
crosstab_num_paid <- CrossTable(clases_num_s_x, udemy_data$is_paid, 
                     dnn = c("Classes num_subscribers", "Status is_paid"), 
                     format = "SPSS", output = "crosstab_num_paid.png")


# Graphics

# Needed elements
# Classes (rating; num_subscribers)
# Rating
clases_rating <- seq(from = 0,to = 500, by = 100)
clases_rating_x
# Number of Subscribers
clases_num_s <- seq(from = 0,to = 40000, by = 4000)
clases_num_s_x
# Install necessary libraries 
install.packages("ggplot2")
library(ggplot2)
# Create an object with ranges for rating
rang_label_rating = c("(0, 100]", "(100, 200]", "(200, 300]", 
                      "(300, 400]", "(400,500]")
# Create an object with ranges for num_subscribers
rang_label_num_s = c("(0, 4000]", "(4000, 8000]", "(8000, 12000]", 
                     "(12000, 16000]", "(16000,20000]", "(20000, 24000]", 
                     "(24000, 28000]", "(28000, 32000]", "(32000, 36000]", "(36000, 40000]")

# Scatter Diagram: rating & num_subscribers
scat_corr_r_n <- ggplot(udemy_data, aes(x=udemy_data$rating, 
                       y=udemy_data$num_subscribers, 
                       group=clases_rating_x)) + geom_point(aes(color=
                       clases_rating_x)) + scale_color_manual(values=
                       c(wes_palette(n=5, name="Darjeeling1"))) + ggtitle("Scatter 
                       of rating & number of subscribers") + xlab("
                       Rating") + ylab("Numer of Subscribers") + theme_bw()
# Another way of the same scatter diagram could be
scat_plot_corr_r_n <- plot(udemy_data$rating, udemy_data$num_subscribers, main = 'Correlation', 
     ylab = 'Number of subscribers',xlab = 'Rating', 
     col=wes_palette(n=5, name="Darjeeling1")[factor(clases_rating_x)]) 
# Adds a small square with color explanation
legend(x = "topleft", 
       legend = c(rang_label_rating), 
       fill = wes_palette(n=5, name="Darjeeling1"), 
       title = "Ranting") 

# Scatter Diagram: rating, num_subscribers & is_paid
# Create Scatter Diagram
scat_corr_r_n_p <- ggplot(udemy_data, aes(x=udemy_data$rating, 
                   y=udemy_data$num_subscribers, 
                   group=udemy_data$is_paid)) + geom_point(aes(color=udemy_data$is_paid)) + scale_color_manual(values=c(wes_palette(n=2, 
                   name="Darjeeling1"))) + ggtitle("Scatter of is_paid") +
                   xlab("Rating") + ylab("Numer of Subscribers") + theme_bw() 
# Another way of the same scatter diagram could be
scat_corr_plot_r_n_p <- plot(x = udemy_data$rating, y = udemy_data$num_subscribers, 
                        ylab = 'Rating',xlab = 'Number of subscribers', 
                        col= wes_palette(n=2, name="Darjeeling1")) 
# Adds a small square with color explanation
legend(x = "topleft", 
       legend = c("True", "False"), 
       fill = c(wes_palette(n=2, name="Darjeeling1")), 
       title = "Status is_paid")

# Grouped Bar graphic
# Created necessary table element
table_is_p <- table(udemy_data$is_paid, clases_num_s_x)
# Create group barplot
bar_group_n_p <- barplot(table_is_p, xlab="Number of subscribers", 
                 main="Grouped Barplot: num_subscribers & is_paid",beside=TRUE, 
                 ylim = c(0,15000), 
                 names.arg = rang_label_num_s, 
                 col = c(wes_palette(n=2, name="Darjeeling1")), 
                 ylab="Number of courses")
# Adds a small square with color explanation
legend(x = "topright", 
       legend = c("False", "True"), 
       fill = wes_palette(n=2, name="Darjeeling1"), 
       title = "Status is_paid")


# Tables
# Necessary libraries
install.packages("modelsummary")
library(modelsummary)
install.packages("webshot2")
library(webshot2)
install.packages("gt")
library(gt)
library(gtsummary)

# Covariances table
# Needed element names for table
summary_num_s_names <- names(summary_num_s)
# Transform into a data frame
cov_frame <- data.frame(Variables = c("Num_subscribers - Rating", 
                        "Num_subscribers - Is_paid", "Is_paid - Rating"), 
                        Value = as.numeric(cov_num_rating, 
                         cov_num_paid, cov_paid_rating))
# Create table with gt() 
cov_tabl <- cov_frame%>% 
  gt() %>% tab_header(title 
           = "Covariance analysis") %>% 
           opt_row_striping() %>% opt_table_lines("all")

# Correlation table
# Transform into a data frame
corr_frame <- data.frame(Variables = c("num_subscribers - rating", 
                        "num_subscribers - is_paid", "is_paid - rating"), 
                        Value = as.numeric(corr_num_rating, 
                        corr_num_paid, corr_paid_rating))
# Create table with gt() 
corr_tabl <- corr_frame%>% 
  gt() %>% tab_header(title 
           = "Covariance analysis") %>% 
           opt_row_striping() %>% opt_table_lines("all")

# Regressions tables
modelsummary(reg_num_rating, output = "reg_num_rating.png")
modelsummary(reg_num_paid, output = "reg_num_paid.png")
modelsummary(reg_paid_rating, output = "reg_paid_rating.png")
