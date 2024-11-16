# Install necessary libraries
if (!require(readr)) install.packages("readr")
if (!require(wesanderson)) install.packages("wesanderson")
if (!require(agricolae)) install.packages("agricolae")
if (!require(plotly)) install.packages("plotly")
if (!require(gt)) install.packages("gt")
if (!require(gtsummary)) install.packages("gtsummary")

# Load necessary library
library(readr)
library(plotly)
library(gt)
library(gtsummary)
library(wesanderson)

# Import and read udemy_data.csv
udemy_data <- read_csv("/Users/lexi/Documents/data_repos/r_stat_ort/udemy_data.csv")
View(udemy_data)

# Summarized amount of FALSE and TRUE observations
summary_is_p <- summary(udemy_data$is_paid)

# Frequencies
# Create the object for the absolute frequency
frecAbs_is_p <- table(udemy_data$is_paid)
# Create the object for relative frequency
frecRel_is_p <- prop.table(frecAbs_is_p)
# Calculate percentage frequency
frecPor_is_p <- frecRel_is_p*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
distfrec_is_p <- cbind(frecAbs_is_p,frecRel_is_p,frecPor_is_p)


# Graphics and more
# Bar graphic
# Create bar graphic for absolute frequency 
bar_s_paid <- barplot(frecAbs_is_p, ylim = c(0,14000),
              xlim= c(0,5), main="Bar chart of is_pais absolute frequency", 
              xlab="is_paid", ylab="Freq. Absoluta",col=wes_palette(n=2, name="Darjeeling1"))
# Adds a small square with color explanation
legend(x = "topright", 
       legend = c("True", "False"), 
       fill = c(wes_palette(n=2, name="Darjeeling1")), 
       title = "Status is_paid")

# Pie chart
# Create an object with ranges
label_s_p = c("False", "True")
#Determinar FrecAbs_num_s as data.frame
frecAbs_is_p_frame = data.frame(frecAbs_is_p)
# Create pie chart for absolute frequency
pie_is_p = plot_ly(frecAbs_is_p_frame, labels = label_s_p, 
                     values=frecPor_is_p, type = 'pie', 
                     marker=list(colors=c(wes_palette(n=2, name="Darjeeling1")))) %>% layout(
                     title="Pie Chart of is_paid absolute frequency")
pie_is_p

# Table
# Summary Table
# Needed element names for table
summary_is_p_names <- names(summary_is_p)
# Transform summary into a data frame
summary_is_p_frame <- data.frame(Statistics = summary_is_p_names, Value = as.numeric(summary_is_p))
# Create table with gt() 
summary_is_p_tabl <- summary_is_p_frame %>% 
  gt() %>% tab_header(title 
  = "Summary is_paid") %>% opt_row_striping() %>% 
  opt_table_lines("all")
summary_is_p_tabl
