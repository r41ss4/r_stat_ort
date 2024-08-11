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
                       group=clases_rating_x)) + geom_point(aes(color=
                                                clases_rating_x)) + scale_color_manual(values=
                                                c(wes_palette(n=5, name="Darjeeling1"))) + ggtitle("Scatter of rating & number of subscribers") + xlab("
                                                Rating") + ylab("Numer of Subscribers") + theme_bw()
# Another way of the same scatter diagram could be
plot(udemy_data$rating, udemy_data$num_subscribers, main = 'Correlation', 
     ylab = 'Number of subscribers',xlab = 'Rating', 
     col=wes_palette(n=5, name="Darjeeling1")[factor(clases_rating_x)]) 
# Next line adds a smal square with color explanation
legend(x = "topleft", 
       legend = c("(0, 100]", "(100, 200]", "(200, 300]", 
                  "(300, 400]", "(400,500]"), 
       fill = wes_palette(n=5, name="Darjeeling1"), 
       title = "Ranting") 

# Scatter Diagram: rating, num_subscribers & is_paid
# Create Scatter Diagram
ggplot(udemy_data, aes(x=udemy_data$rating, 
                       y=udemy_data$num_subscribers, 
                       group=udemy_data$is_paid)) + geom_point(aes(color=udemy_data$is_paid)) + scale_color_manual(values=c(wes_palette(n=2, 
                        name="Darjeeling1"))) + ggtitle("Scatter of is_paid") +
                        xlab("Rating") + ylab("Numer of Subscribers") + theme_bw() 
# Another way of the same scatter diagram could be
plot(x = udemy_data$rating, y = udemy_data$num_subscribers, 
     col= wes_palette(n=2, name="Darjeeling1")) # FIX COLORS
# Next line adds a smal square with color explanation
legend(x = "topleft", 
       legend = c("True", "False"), 
       fill = c(wes_palette(n=2, name="Darjeeling1")), 
       title = "Status is_paid")

# Bar graphic
# This has issue: ✖ Fix the following mappings: `y`.
ggplot(udemy_data, aes(fill=udemy_data$is_paid, 
                 y= FrecGrossPM__num_s,
                 x=udemy_data$num_subscribers,
                 group=clases_num_s_x)) + scale_color_manual(values=
                 c(wes_palette(n=2, name="Darjeeling1"))) + ggtitle("Scatter of number of subscribers 
                 & is_paid") + xlab("
                 Number of subscribers") + ylab("Numer of courses") + theme_bw(
                 ) + geom_bar(position="dodge2", stat="identity", 
                fill = wes_palette(n=2, name="Darjeeling1"), 
                colour = "black")
# This one solves it, but bars are too together and I can not modify this
# which is why I am trying to use ggplot to solve this
barplot(FrecAbs_num_s, 
        col=wes_palette(n=2, name="Darjeeling1"), 
        font.axis=2, 
        beside=T, 
        ylim = c(0,14000), 
        main="Bar chart of is_pais absolute frequency", 
        xlab="Number of subscribers", 
        ylab="Amount of courses", 
        font.lab=2, 
        names.arg = c("(0, 4000]", "(4000, 8000]", "(8000, 12000]", "(12000, 16000]", "(16000,20000]", "(20000, 24000]", "(24000, 28000]", "(28000, 32000]", "(32000, 36000]", 
                      "(36000, 40000]"))
legend(x = "topright", 
       legend = c("True", "False"), 
       fill = wes_palette(n=2, name="Darjeeling1"), title = "Status is_paid")

