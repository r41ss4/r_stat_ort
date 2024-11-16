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

# Import and read udemy_data.csv
udemy_data <- read_csv("/Users/lexi/Documents/data_repos/r_stat_ort/udemy_data.csv")
View(udemy_data)

# Summary of variable and class division
summary_num_s <- summary(udemy_data$num_subscribers)

# Use a class division within this variable
clases_num_s <- seq(from = 0,to = 40000, by = 4000)
clases_num_s_x <- cut(udemy_data$num_subscribers, breaks = clases_num_s)
frecGrossPM_num_s  <- data.frame(table (clases_num_s_x))
frecGrossPM_num_s


# Frequencies
# Create the object for the absolute frequency
frecAbs_num_s <- table(clases_num_s_x)
# Create the object for relative frequency
frecRel_num_s <- prop.table(frecAbs_num_s)
# Calculate percentage frequency
frecPor_num_s <- frecRel_num_s*100
# Calculate the frequency distribution
disfrec_num_s <- cbind (frecAbs_num_s, frecRel_num_s, frecPor_num_s)


# Graphics and more

# Bar graphic
# Create an object with ranges
rang_label_num_s = c("(0, 4000]", "(4000, 8000]", "(8000, 12000]", 
                     "(12000, 16000]", "(16000,20000]", "(20000, 24000]", 
                     "(24000, 28000]", "(28000, 32000]", "(32000, 36000]", "(36000, 40000]")

# Create Bar plot for absolute frequency
bar_num_s <- barplot(frecAbs_num_s, col=wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
             beside = TRUE, main = "Bar chart of num_subscribers", 
             xlab = "Number of subscribers in classes division", 
             ylab = "Amount of Udemy courses", 
             ylim = c(0,13000), 
             names.arg = rang_label_num_s)
# Add legend
legend(x = "topright", 
       legend = c(rang_label_num_s), 
       fill = wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
       title = "Ranges") 

# Histogram
# Create an object that contains a histogram
hist_num_s <- hist(udemy_data$num_subscribers, col=wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
              main = "Histogram of num_subscribers", 
              ylim = c(0,14000),
              xlab = "Number of subscribers", 
              ylab = "Number of courses")
# Add legend
legend(x = "topright", 
       legend = c(rang_label_num_s), 
       fill = wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
       title = "Ranges") 

# Ogive 
# Based on hist_num_s object, create an ogive
ogive_num_s <- ogive.freq(hist_num_s, ,type="b", col=wes_palette(n=1, name="Darjeeling1"), 
               xlab = "Number of subscribers", ylab = "Absolute Frequency")

# Pie chart
# Determinar frecAbs_num_s as data.frame
frecAbs_num_s_frame = data.frame(frecAbs_num_s)
# Create pie chart for absolute frequency
pie_num_s = plot_ly(frecAbs_num_s_frame, labels = rang_label_num_s, 
                    values=frecPor_num_s,  type = 'pie', 
                    marker=list(colors=c(wes_palette(n=10, name="Darjeeling1", type = "continuous")))) %>% layout(
                    title="Pie Chart of num_subscribers absolute frequency")
pie_num_s


# Measurements regarding num_subscribers

# Measures of central tendency
# Mean 
media_num_s <- mean(udemy_data$num_subscribers, na.rm = TRUE)
# Median 
mediana_num_s <- median(udemy_data$num_subscribers, na.rm = TRUE)
# Mode requires us to create the function 
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda_num_s <- getmode(udemy_data$num_subscribers)

# Separation measures
# Deciles
decils_num_s <- quantile(udemy_data$num_subscribers,c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90), na.rm = TRUE)
# Quintiles
quint_num_s <- quantile(udemy_data$num_subscribers,c(0.20,0.40,0.60,0.80), na.rm = TRUE)
# Quartiles
quarts_num_s <- quantile(udemy_data$num_subscribers,c(0.25,0.50,0.75), na.rm = TRUE)

# Measures of dispersion
# Range
range_num_s  <- range(udemy_data$num_subscribers, na.rm = TRUE)
# Interquartile range
range_inter_num_s <- IQR(udemy_data$num_subscribers, na.rm = TRUE)
# Variance
variance_num_s <- var(udemy_data$num_subscribers, na.rm = TRUE) 
# Standard deviation
desv_est_num_s <- sd(udemy_data$num_subscribers, na.rm = TRUE)
# Coefficient of variation requires us to create the function
coef_var <- function(num_subscribers, na.rm = TRUE) {
  desv_est_num_s / media_num_s 
}
coef_var_num_s <- coef_var(udemy_data$num_subscribers)


# Graphic of atipic measurements
# Boxplot
atip_num_s <- boxplot(frecAbs_num_s, 
              main = "Boxplot rating & atipic measurements",
              xlab = "Number of subscribers",
              ylab = "All courses",
              col = "orange",
              border = "brown",
              horizontal = TRUE)


# Tables
# Summary Table
# Needed element names for table
summary_num_s_names <- names(summary_num_s)
# Transform summary into a data frame
summary_num_s_frame <- data.frame(Statistics = summary_num_s_names, Value = as.numeric(summary_num_s))
# Create table with gt() 
summary_num_s_tabl <- summary_num_s_frame%>% 
  gt() %>% tab_header(title 
  = "Summary num_subscribers")%>% opt_row_striping() %>% 
  opt_table_lines("all")
summary_num_s_tabl

# Deciles table
# Needed element names for table
decils_num_s_names <- names(decils_num_s)
# Transform into a data frame
decils_num_s_frame <- data.frame(Percentage = decils_num_s_names, Observations = as.numeric(decils_num_s))
# Create table with gt() 
decils_num_s_tabl <- decils_num_s_frame%>% 
  gt() %>% tab_header(title 
  = "Deciles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all")
decils_num_s_tabl

# Quintiles table
# Needed element names for table
quint_num_s_names <- names(quint_num_s)
# Transform into a data frame
quint_num_s_frame <- data.frame(Percentage = quint_num_s_names, Observations = as.numeric(quint_num_s))
# Create table with gt() 
quint_num_s_tabl <- quint_num_s_frame%>% 
  gt() %>% tab_header(title 
  = "Quintiles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all")
quint_num_s_tabl

# Quartiles table
# Needed element names for table
quarts_num_s_names <- names(quarts_num_s)
# Transform into a data frame
quarts_num_s_frame <- data.frame(Percentage = quarts_num_s_names, Observations = as.numeric(quarts_num_s))
# Create table with gt() 
quarts_num_s_tabl <- quarts_num_s_frame%>% 
  gt() %>% tab_header(title 
  = "Quartiles percentage and tendencies")%>% opt_row_striping() %>% 
  opt_table_lines("all")
quarts_num_s_tabl