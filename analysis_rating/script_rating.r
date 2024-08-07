# Download necessary library to read file 
library(readr)
# Import and read udemy_data.csv
udemy_data <- read_csv("udemy_data.csv")
View(udemy_data)

# Observe  the minimum, maximum, quartiles, mean, median and NA data
summary_rating <- summary(udemy_data$rating)

# Given the large number of observations, use a class division within this variable
clases_rating <- seq(from = 0,to = 500, by = 100)
clases_rating_x <- cut(udemy_data$rating, breaks = clases_rating)
FrecGrossPM_rating  <- data.frame(table (clases_rating_x))
FrecGrossPM_rating

# Frequencies
# Create the object for the absolute frequency
FrecAbs_rating <- table(clases_rating_x)
# Create the object for relative frequency
FrecRel_rating <- prop.table(FrecAbs_rating)
# Calculate percentage frequency
FrecPor_rating <- FrecRel_rating*100
# Based on the absolute, relative and percentage frequency, calculate the frequency distribution
DisFrec_rating <- cbind (FrecAbs_rating, FrecRel_rating, FrecPor_rating)


# Graphics and more

# Bar graphic
# Create bar graphic for absolute frequency 
# Define colors object to use in graphics
my_colors <- c("lavender", "mistyrose", "lightcyan", "lightblue", "cornsilk")
# Create Bar plot for absolute frequency, apply colors object and
barplot(FrecAbs_rating, col = my_colors, 
        beside = TRUE, main = "Bar chart of rating", 
        xlab = "Rating", ylab = "Amount of Udemy courses", 
        names.arg = c("(0, 100]", "(100, 200]", "(200, 300]", 
                      "(300, 400]", "(400,500]"))

# Histogram
# For some graphs, it is necessary to download agricolae library
install.packages("agricolae")
library(agricolae)
# Create an object that contains a histogram
hist_rating <- hist(udemy_data$rating, col = my_colors, 
                   main = "Histogram of rating", 
                   xlab = "Rating", ylab = "Number of courses")

# Ogive 
# Based on hist_num_s object, create an ogive
ogive.freq(hist_rating,type="b", col = "purple", 
           xlab = "Rating", ylab = "Absolute Frequency")

# Pie chart
# Create bar graphic for absolute frequency 
pie(FrecAbs_num_s,
    labels = c("(0, 100]", "(100, 200]", "(200, 300]", 
               "(300, 400]", "(400,500]"), 
    col= my_colors, 
    main="Pie Chart of num_subscribers absolute frequency")


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
deciles_rating <- quantile(udemy_data$rating,c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90), na.rm = TRUE)
# Quintiles
# Quartiles
cuartiles_rating <- quantile(udemy_data$rating, c(0.25,0.50,0.75), na.rm = TRUE)

# Measures of dispersion
# Range
rango_rating  <- range(udemy_data$rating, na.rm = TRUE)
# Interquartile range
rango_inter_rating <- IQR(udemy_data$rating, na.rm = TRUE)
# Variance
varianza_rating <- var(udemy_data$rating, na.rm = TRUE) 
# Standard deviation
desviacion_est_rating <- sd(udemy_data$rating, na.rm = TRUE)
# Coefficient of variation requires us to create the function
coef_var <- function(rating, na.rm = TRUE) {
  desviacion_est_rating / media_rating 
}
coef_var_rating <- coef_var(udemy_data$rating)

