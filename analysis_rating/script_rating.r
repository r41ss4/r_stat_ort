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
install.packages('wesanderson')
library('wesanderson')
# Create an object with ranges
rang_label_rating = c("(0, 100]", "(100, 200]", "(200, 300]", 
                      "(300, 400]", "(400,500]")
# Create Bar plot for absolute frequency, apply colors object and
bar_rating <- barplot(FrecAbs_rating, 
              col=wes_palette(n=5, name="Darjeeling1"), 
              beside = TRUE, main = "Bar chart of rating", 
              xlab = "Rating", ylab = "Amount of Udemy courses", 
              names.arg = rang_label_rating)
# Adds a small square with color explanation
legend(x = "topleft", 
       legend = c(rang_label_rating), 
       fill = wes_palette(n=5, name="Darjeeling1"), 
       title = "Ranges", xpd=TRUE, cex=0.8, inset=c(+.03, -.05)) 

# Histogram
# For some graphs, it is necessary to download agricolae library
install.packages("agricolae")
library(agricolae)
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
# Install selected package to make piecharts (plotly)
install.packages("plotly")
# Call needed libraries
library(plotly)
#Determinar FrecAbs_num_s as data.frame
FrecAbs_rating_frame = data.frame(FrecAbs_rating)
# Create pie chart for absolute frequency
pie_rating = plot_ly(FrecAbs_rating_frame, labels = rang_label_rating, 
                    values=FrecPor_rating, type = 'pie', 
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
  
