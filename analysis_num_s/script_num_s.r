# Download necessary library to read file 
library(readr)
# Import and read udemy_data.csv
udemy_data <- read_csv("udemy_data.csv")
View(udemy_data)

# Observe  the minimum, maximum, quartiles, mean, median and NA data
summary_num_s <- summary(udemy_data$num_subscribers)

# Given the large number of observations, use a class division within this variable
clases_num_s <- seq(0,40000, by = 4000)
clases_num_s_x <- cut(udemy_data$num_subscribers, breaks = clases_num_s)
FrecGrossPM_num_s  <- data.frame(table (clases_num_s_x))
FrecGrossPM_num_s

# Create the object for the absolute frequency
FrecAbs_num_s <- table(clases_num_s_x)
# Visualize the object FrecRel_num_s within terminal, calculation of relative frequency
FrecRel_num_s <- prop.table(FrecAbs_num_s)
# Calculate percentage frequency
FrecPor_num_s <- FrecRel_num_s*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
DisFrec_num_s <- cbind (FrecAbs_num_s, FrecRel_num_s, FrecPor_num_s)


