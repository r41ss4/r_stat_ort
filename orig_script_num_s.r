#En esta parte se analiza la variable cuantitativa num_subscribers
#Se presenta  las frecuencias (relativas, absolutas, etc.) de la variable

install.packages("readr")
# data1 <- read_csv('data/hotel_bookings_clean.csv')
#Para una visión general de la variable, se puede utilizar la siguiente línea, que nos aporta el mínimo, el máximo, los cuartiles, la media, la mediana y los datos NA
summary_num_s <- summary(udemy_data$num_subscribers)


#Para nuestro análisis, necesitamos muchos más datos y también repasamos cómo obtener los datos ya mencionados de manera individual. Dada la gran cantidad de observaciones, utilizaremos una división de clases dentro de esta variable
clases_num_s <- seq(0,40000, by = 4000)
clases_num_s_x <- cut(udemy_data$num_subscribers, breaks = clases_num_s)
FrecGrossPM_num_s  <- data.frame(table (clases_num_s_x))
FrecGrossPM_num_s

#Empezando por la frecuencia absoluta, se debe construir el objeto
FrecAbs_num_s <- table(clases_num_s_x)
#La siguiente línea es para mostrar el objeto recién creado
FrecRel_num_s <- prop.table(FrecAbs_num_s)
#Además, nos puede interesar la frecuencia porcentual, para esto debemos utilizar la siguiente línea de código 
FrecPor_num_s <- FrecRel_num_s*100
#A este punto, tenemos los elementos creados de la frecuencia porcentual, la absoluta y la relativa de la variable num_subscribers 
#Con los elementos creados hasta el momento, se puede obtener la distribución de frecuencias, para lo que se utiliza el siguiente código, que nos permite operar con los elementos ya creados
DisFrec_num_s <- cbind (FrecAbs_num_s, FrecRel_num_s, FrecPor_num_s)
#Para crear el histograma necesitamos las siguientes líneas de código
barplot(FrecAbs_num_s)
#Para algunas gráficas representativas de estos datos, como el histograma y la ojiva, es necesario bajar una librería
install.packages("agricolae")
library(agricolae)
#Es necesario crear un objeto que contenga un histograma de la frecuencia 
Histograma_num_s <- hist(udemy_data$num_subscribers)
#La siguiente línea crea el histograma que se ve en Plots
ogive.freq(Histograma_num_s)
install.packages(“plotly”)


#Siguiendo el orden del Trabajo Obligatorio, comienzo con las medidas de tendencia central
#La siguiente línea de código permite crear el elemento de la media de la variable
Media_num_s <- mean(udemy_data$num_subscribers, na.rm = TRUE)
#La mediana, se escribe en la siguiente línea, cabe aclarar que na.rm = TRUE nos permite ignorar los N/A
Mediana_num_s <- median(udemy_data$num_subscribers, na. rm = TRUE)
#La última medida central que vale la pena que tengamos en cuenta es la moda, para esta medida, debemos utilizar una librería diferente y crear la función
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
#Ahora se puede crear un objeto que contenga la información de la moda
Moda_num_s <- getmode(udemy_data$num_subscribers)
#El siguiente grupo de medidas que se analiza de la variable es el de las medidas de separación. Teniendo presente los percentiles, nos centramos en los deciles, quintiles y cuartiles
#Las siguientes líneas nos permiten conocer los deciles:
Deciles_num_s <- quantile(udemy_data$num_subscribers,c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90), na.rm = TRUE)
#Las siguientes líneas nos permiten conocer los quintiles: 
Quintiles_num_s <- quantile(udemy_data$num_subscribers,c(0.20,0.40,0.60,0.80), na.rm = TRUE)
#Las siguientes líneas nos permiten conocer los cuartiles: 
Cuartiles_num_s <- quantile(udemy_data$num_subscribers,c(0.25,0.50,0.75), na.rm = TRUE)

#Con los cuartiles, podemos comenzan a averiguar el Rango Intercuartílico y otras medidas de dispersión. 
#La sigiuente línea nos da la primera línea de dispersión, el rango de la variable num_subscribers
Rango_num_s  <- range(udemy_data$num_subscribers, na.rm = TRUE)
#El Rango Intercuarículo, que se calcula restando dos datos que ya tenemos (Q3_4 - Q1_4), se puede calcular de manera incluso más rápida con el siguiente código
Rango_intercuartilico_num_s <- IQR(udemy_data$num_subscribers, na.rm = TRUE)
#La varianza, elemento que de por sí nos proporciona información, pero también nos sirve para varias operaciones, se construye de la siguiente manera
Varianza_num_s <- var(udemy_data$num_subscribers, na.rm = TRUE) 
#La desviación estándar se construye de la siguiente manera
Desviacion_est_num_s <- sd(udemy_data$num_subscribers, na.rm = TRUE)
#Para el coeficiente de variación, al igual que para otros datos ya realizados, es necesario crear la función, por lo que necesitaremos un par de líneas de código
coef_var <- function(num_subscribers, na.rm = TRUE) {
Desviacion_est_num_s / Media_num_s 
}
#Ahora es posible crear el objeto del coeficiente de variación
Coeficiente_var_num_s <- coef_var(udemy_data$num_subscribers)
