# Download necessary library to read file 
library(readr)
# Import and read udemy_data.csv
udemy_data <- read_csv("udemy_data.csv")
View(udemy_data)

# Observe  the minimum, maximum, quartiles, mean, median and NA data
summary_is_p <- summary(udemy_data$is_paid)
print(summary_is_p)

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
barplot(FrecAbs_is_p,ylim = c(0,14000),
        xlim= c(0,5), main="Gráfico de barras de Frecuencia Absoluta", 
        xlab="is_paid", ylab="Freq. Absoluta",col=c(3,4))

# Pie chart
# Create bar graphic for percentage frequency 
pie(FrecPor_is_p, main="Pie Chart of Percentage Frequency", col=c(3,4))
