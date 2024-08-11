# Download necessary library to read file 
library(readr)
# Import and read udemy_data.csv
udemy_data <- read_csv("udemy_data.csv")
View(udemy_data)

# Observe  the minimum, maximum, quartiles, mean, median and NA data
summary_num_s <- summary(udemy_data$num_subscribers)

# Given the large number of observations, use a class division within this variable
clases_num_s <- seq(from = 0,to = 40000, by = 4000)
clases_num_s_x <- cut(udemy_data$num_subscribers, breaks = clases_num_s)
FrecGrossPM_num_s  <- data.frame(table (clases_num_s_x))
FrecGrossPM_num_s


# Frequencies
# Create the object for the absolute frequency
FrecAbs_num_s <- table(clases_num_s_x)
# Create the object for relative frequency
FrecRel_num_s <- prop.table(FrecAbs_num_s)
# Calculate percentage frequency
FrecPor_num_s <- FrecRel_num_s*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
DisFrec_num_s <- cbind (FrecAbs_num_s, FrecRel_num_s, FrecPor_num_s)


# Graphics and more

# Bar graphic
# Create bar graphic for absolute frequency 
# Define colors object to use in graphics
install.packages('wesanderson')
library('wesanderson')
# Create Bar plot for absolute frequency and apply colors object 
bar_num_s <- barplot(FrecAbs_num_s, col=wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
             beside = TRUE, main = "Bar chart of num_subscribers", 
             xlab = "Number of subscribers in classes division", 
             ylab = "Amount of Udemy courses", 
             names.arg = c("(0, 4000]", "(4000, 8000]", "(8000, 12000]", 
                      "(12000, 16000]", "(16000,20000]", "(20000, 24000]", 
                      "(24000, 28000]", "(28000, 32000]", "(32000, 36000]", "(36000, 40000]"))

# Histogram
# For some graphs, it is necessary to download agricolae library
install.packages("agricolae")
library(agricolae)
# Create an object that contains a histogram
hist_num_s <- hist(udemy_data$num_subscribers, col=wes_palette(n=10, name="Darjeeling1", type ="continuous"), 
              main = "Histogram of num_subscribers", 
              xlab = "Number of subscribers", ylab = "Number of courses")

# Ogive 
# Based on hist_num_s object, create an ogive
ogive_num_s <- ogive.freq(hist_num_s, ,type="b", col=wes_palette(n=1, name="Darjeeling1"), 
               xlab = "Number of subscribers", ylab = "Absolute Frequency")

# Pie chart
# Create bar graphic for absolute frequency 
pie_num_s <- pie(FrecPor_num_s,
             labels = c("(0, 4000]", "(4000, 8000]", "(8000, 12000]", "(12000, 16000]", 
             "(16000,20000]", "(20000, 24000]", "(24000, 28000]", 
             "(28000, 32000]", "(32000, 36000]", "(36000, 40000]"), 
             col=wes_palette(n=10, name="Darjeeling1", type = "continuous"),
             main="Pie Chart of num_subscribers absolute frequency")


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
  desviation_est_num_s / media_num_s 
}
coef_var_num_s <- coef_var(udemy_data$num_subscribers)


# Graphic of atipic measurements
# Boxplot
atip_num_s <- boxplot(FrecAbs_num_s, 
              main = "Boxplot rating & atipic measurements",
              xlab = "Number of subscribers",
              ylab = "All courses",
              col = "orange",
              border = "brown",
              horizontal = TRUE)
