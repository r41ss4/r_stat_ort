# Install necessary libraries
if (!require(readr)) install.packages("readr")
if (!require(wesanderson)) install.packages("wesanderson")
if (!require(agricolae)) install.packages("agricolae")
if (!require(plotly)) install.packages("plotly")
if (!require(gt)) install.packages("gt")
if (!require(gtsummary)) install.packages("gtsummary")

# Load libraries
library(readr)
library(wesanderson)
library(agricolae)
library(plotly)
library(gt)
library(gtsummary)

# Import and read udemy_data.csv from repository
udemy_data <- read_csv("https://raw.githubusercontent.com/r41ss4/r_stat_ort/main/udemy_data.csv")
View(udemy_data)

# Observe  the minimum, maximum, quartiles, mean, median and NA data
summary_rating <- summary(udemy_data$rating)

# Given the large number of observations, use a class division within this variable
clases_rating <- seq(from = 0,to = 500, by = 100)
clases_rating_x <- cut(udemy_data$rating, breaks = clases_rating)
frecGrossPM_rating  <- data.frame(table (clases_rating_x))
frecGrossPM_rating

# Frequencies
# Create the object for the absolute frequency
frecAbs_rating <- table(clases_rating_x)
# Create the object for relative frequency
frecRel_rating <- prop.table(frecAbs_rating)
# Calculate percentage frequency
frecPor_rating <- frecRel_rating*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
disFrec_rating <- cbind (frecAbs_rating, frecRel_rating, frecPor_rating)


# Graphics and more

# Bar graphic
# Create an object with ranges
rang_label_rating = c("(0, 100]", "(100, 200]", "(200, 300]", 
                      "(300, 400]", "(400,500]")
# Create Bar plot for absolute frequency
bar_rating <- barplot(frecAbs_rating, 
              col=wes_palette(n=5, name="Darjeeling1"), 
              beside = TRUE, main = "Bar chart of rating", 
              xlab = "Rating", ylab = "Amount of Udemy courses", 
              names.arg = rang_label_rating) 
# Add legend
legend(x = "topleft", 
       legend = c(rang_label_rating), 
       fill = wes_palette(n=5, name="Darjeeling1"), 
       title = "Ranges", xpd=TRUE, cex=0.8, inset=c(+.03, -.05)) 

# Histogram
# Create an object that contains a histogram
hist_rating <- hist(udemy_data$rating, col=wes_palette(n=10, name="Darjeeling1", 
               type = "continuous"), ylim = c(0,6000),
               main = "Histogram of rating", xlab = "Rating", 
               ylab = "Number of courses")
# Adds a small square with color explanation
legend(x = "topleft", 
       legend = c(rang_label_num_s), 
       fill = wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
       title = "Ranges", xpd=TRUE, cex=0.6, inset=c(+.02, -.08)) 

# Ogive 
# Based on hist_num_s object, create an ogive
ogive_rating <- ogive.freq(hist_rating,type="b", col=wes_palette(n=1, name="Darjeeling1"), 
                xlab = "Rating", ylab = "Absolute Frequency")

# Pie chart
# Determinar frecAbs_num_s as data.frame
frecAbs_rating_frame = data.frame(frecAbs_rating)
# Create pie chart for absolute frequency
pie_rating = plot_ly(frecAbs_rating_frame, labels = rang_label_rating, 
                    values=frecPor_rating, type = 'pie', 
                    marker=list(colors=c(wes_palette(n=5, name="Darjeeling1")))) %>% layout(
                    title="Pie Chart of rating absolute frequency")
pie_rating 


# Measurements regarding num_subscribers

# Measures of central tendency
# Mean 
media_rating <- mean(udemy_data$rating, na.rm = TRUE)
# Median 
mediana_rating <- median(udemy_data$rating, na.rm = TRUE)
# Mode requires us to create the function 
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda_rating <- getmode(udemy_data$rating)

# Separation measures
# Deciles
decils_rating <- quantile(udemy_data$rating,c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90), na.rm = TRUE)
# Quintiles
quint_rating <- quantile(udemy_data$rating,c(0.20,0.40,0.60,0.80), na.rm = TRUE)
# Quartiles
quarts_rating <- quantile(udemy_data$rating, c(0.25,0.50,0.75), na.rm = TRUE)

# Measures of dispersion
# Range
range_rating  <- range(udemy_data$rating, na.rm = TRUE)
# Interquartile range
range_inter_rating <- IQR(udemy_data$rating, na.rm = TRUE)
# Variance
variance_rating <- var(udemy_data$rating, na.rm = TRUE) 
# Standard deviation
desv_est_rating <- sd(udemy_data$rating, na.rm = TRUE)
# Coefficient of variation requires us to create the function
coef_var <- function(rating, na.rm = TRUE) {
  desv_est_rating / media_rating 
}
coef_var_rating <- coef_var(udemy_data$rating)


# Graphic of atipic measurements
# Boxplot
atip_rating <- boxplot(udemy_data$rating, 
               main = "Boxplot rating & atipic measurements",
               xlab = "Rating",
               ylab = "All courses",
               col = "orange",
               border = "brown",
               horizontal = TRUE)
 

# Tables
# Summary Table
# Needed element names for table
summary_rating_names <- names(summary_rating)
# Transform summary into a data frame
summary_rating_frame <- data.frame(Statistics = summary_rating_names, Value = as.numeric(summary_rating))
# Create table with gt() 
summary_rating_tabl <- summary_rating_frame%>% 
  gt() %>% tab_header(title 
  = "Summary num_subscribers")%>% opt_row_striping() %>% 
  opt_table_lines("all")
summary_rating_tabl

# Deciles table
# Needed element names for table
decils_rating_names <- names(decils_rating)
# Transform into a data frame
decils_rating_frame <- data.frame(Percentage = decils_rating_names, Observations = as.numeric(decils_rating))
# Create table with gt() 
decils_rating_tabl <- decils_rating_frame%>% 
  gt() %>% tab_header(title 
  = "Deciles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all")
decils_rating_tabl

# Quintiles table
# Needed element names for table
quint_rating_names <- names(quint_rating)
# Transform into a data frame
quint_rating_frame <- data.frame(Percentage = quint_rating_names, Observations = as.numeric(quint_rating))
# Create table with gt() 
quint_rating_tabl <- quint_rating_frame%>% 
  gt() %>% tab_header(title 
  = "Quintiles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all")
quint_rating_tabl

# Quartiles table
# Needed element names for table
quarts_rating_names <- names(quarts_rating)
# Transform into a data frame
quarts_rating_frame <- data.frame(Percentage = quarts_rating_names, Observations = as.numeric(quarts_rating))
# Create table with gt() 
quarts_rating_tabl <- quarts_rating_frame%>% 
  gt() %>% tab_header(title 
  = "Quartiles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all") 
quarts_rating_tabl