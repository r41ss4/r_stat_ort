# Correlation analysis measurements
#Covariances
cov_num_rating = cov(udemy_data$num_subscribers, udemy_data$rating)
cov_num_paid = cov(udemy_data$num_subscribers, udemy_data$is_paid)
cov_paid_rating = cov(udemy_data$is_paid, udemy_data$rating)

# Correlation
corr_num_rating = cor(udemy_data$num_subscribers, udemy_data$rating)
corr_num_paid = cor(udemy_data$num_subscribers, udemy_data$is_paid)
corr_paid_rating = cor(udemy_data$is_paid, udemy_data$rating)

#Regression
reg_num_rating = lm(udemy_data$num_subscribers~udemy_data$rating)
reg_num_paid = lm(udemy_data$num_subscribers~udemy_data$is_paid)
reg_paid_rating = lm(udemy_data$is_paid~udemy_data$rating)

# Verification with r2 (correlation square)
corr_num_rating^2


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

# Scatter Diagram: rating & num_subscribers
ggplot(udemy_data, aes(x=udemy_data$rating, 
                       y=udemy_data$num_subscribers, 
                       group=clases_rating_x)) + geom_point(aes(color=clases_rating_x)) + scale_color_manual(values=c(my_colors)) + ggtitle("Scatter of rating & number of subscribers") + xlab("Rating") + ylab("Numer of Subscribers") + theme_bw()
# Another way of the same scatter diagram could be
plot(udemy_data$rating, udemy_data$num_subscribers, main = 'Correlation', 
     ylab = 'Number of subscribers',xlab = 'Rating', 
     col=clases_rating_x) 
# Next line adds a smal square with color explanation
legend(x = "topleft", 
       legend = c("(0, 100]", "(100, 200]", "(200, 300]", 
                  "(300, 400]", "(400,500]"), 
       fill = c("lavender", "mistyrose", "lightcyan", "lightblue", "cornsilk"), 
       title = "Ranting") # FIX COLORS

# Scatter Diagram: rating, num_subscribers & is_paid
# Create Scatter Diagram
ggplot(udemy_data, aes(x=udemy_data$rating, 
                       y=udemy_data$num_subscribers, 
                       group=udemy_data$is_paid)) + geom_point(aes(color=udemy_data$is_paid)) + scale_color_manual(values=c("mistyrose", 
                      "lightblue")) + ggtitle("Scatter of is_paid") +
                        xlab("Rating") + ylab("Numer of Subscribers") + theme_bw() 
# Another way of the same scatter diagram could be
plot(x = udemy_data$rating, y = udemy_data$num_subscribers, col= udemy_data$is_paid) # FIX COLORS
# Next line adds a smal square with color explanation
legend(x = "topleft", 
       legend = c("True", "False"), 
       fill = c("mistyrose", "lightblue"), 
       title = "Status is_paid")





