# Download necessary library to read file 
library(readr)
# Import and read udemy_data.csv
udemy_data <- read_csv("udemy_data.csv")
View(udemy_data)

# Summarized amount of FALSE and TRUE observations
summary_is_p <- summary(udemy_data$is_paid)

# Frequencies
# Create the object for the absolute frequency
FrecAbs_is_p <- table(udemy_data$is_paid)
# Create the object for relative frequency
FrecRel_is_p <- prop.table(FrecAbs_is_p)
# Calculate percentage frequency
FrecPor_is_p <- FrecRel_is_p*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
DistFrec_is_p <- cbind(FrecAbs_is_p,FrecRel_is_p,FrecPor_is_p)


# Graphics and more

# Bar graphic
# Create bar graphic for absolute frequency 
bar_s_paid <- barplot(FrecAbs_is_p, ylim = c(0,14000),
              xlim= c(0,5), main="Bar chart of is_pais absolute frequency", 
              xlab="is_paid", ylab="Freq. Absoluta",col=wes_palette(n=2, name="Darjeeling1"))
# Adds a small square with color explanation
legend(x = "topright", 
       legend = c("True", "False"), 
       fill = c(wes_palette(n=2, name="Darjeeling1")), 
       title = "Status is_paid")

# Pie chart
# Install selected package to make piecharts (plotly)
install.packages("plotly")
# Call needed libraries
library(plotly)
# Create an object with ranges
label_s_p = c("False", "True")
#Determinar FrecAbs_num_s as data.frame
FrecAbs_is_p_frame = data.frame(FrecAbs_is_p)
# Create pie chart for absolute frequency
pie_is_p = plot_ly(FrecAbs_is_p_frame, labels = label_s_p, 
                     values=FrecPor_is_p, type = 'pie', 
                     marker=list(colors=c(wes_palette(n=2, name="Darjeeling1")))) %>% layout(
                     title="Pie Chart of is_paid absolute frequency")
pie_is_p

# Table
# Install necessary libraries 
install.packages("gt")
library(gt)
library(gtsummary)

# Summary Table
# Needed element names for table
summary_is_p_names <- names(summary_is_p)
# Transform summary into a data frame
summary_is_p_frame <- data.frame(Statistics = summary_is_p_names, Value = as.numeric(summary_is_p))
# Create table with gt() 
summary_is_p_tabl <- summary_is_p_frame%>% 
  gt() %>% tab_header(title 
  = "Summary is_paid")%>% opt_row_striping() %>% 
  opt_table_lines("all")

