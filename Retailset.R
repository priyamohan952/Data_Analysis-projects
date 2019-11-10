getwd()
features_data <- read.table("Features_data_set.csv", header = TRUE, sep = ",")

str(features_data)

sum(is.na(features_data))

names(features_data)

features_data$Store <- ifelse(is.na(features_data$Store) == 'TRUE', 1, features_data$Store)

sum(is.na(features_data$Store))

# Find the mode in attribute $Date. Use mode to replace NA values in the $Date attribute

# Function to calculate the mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

features_data$Date <- as.Date(features_data$Date,"%d/%m/%y")
head(features_data$Date)
sapply(features_data$Date,class)

mode_Date <- getmode(features_data$Date)
mode_Date

features_data$Date <- ifelse(is.na(features_data$Date) == 'TRUE', '2010-02-05', features_data$Date)

#check for any NA value value still in attribute$Date
sum(is.na(features_data$Date))

# check for NA's in attribute $Temperature
sum(is.na(features_data$Temperature))

# check for NA's in attribute $Fuel_Price
sum(is.na(features_data$Fuel_Price))

# check for NA's in attribute $MarkDown1
sum(is.na(features_data$MarkDown1))

features_data$MarkDown1 <- ifelse(is.na(features_data$MarkDown1) == TRUE,0,features_data$MarkDown1)

sum(is.na(features_data$MarkDown1))

# check for NA's in attribute $MarkDown2
sum(is.na(features_data$MarkDown2))

features_data$MarkDown2 <- ifelse(is.na(features_data$MarkDown2) == TRUE,0,features_data$MarkDown2)

sum(is.na(features_data$MarkDown2))

# check for NA's in attribute $MarkDown3
sum(is.na(features_data$MarkDown3))

features_data$MarkDown3 <- ifelse(is.na(features_data$MarkDown3) == TRUE,0,features_data$MarkDown3)

sum(is.na(features_data$MarkDown3))


# check for NA's in attribute $MarkDown4
sum(is.na(features_data$MarkDown4))

features_data$MarkDown4 <- ifelse(is.na(features_data$MarkDown4) == TRUE,0,features_data$MarkDown4)

sum(is.na(features_data$MarkDown4))


# check for NA's in attribute $MarkDown5
sum(is.na(features_data$MarkDown5))

features_data$MarkDown5 <- ifelse(is.na(features_data$MarkDown5) == TRUE,0,features_data$MarkDown5)

sum(is.na(features_data$MarkDown5))


# check for NA's in attribute $CPI
sum(is.na(features_data$CPI))

sum(is.na(features_data$MarkDown5))
# check for NA's in attribute $CPI
sum(is.na(features_data$CPI))

# check for NA's in attribute $Unemployment
sum(is.na(features_data$Unemployment))
features_data$Unemployment <- ifelse(is.na(features_data$Unemployment) == TRUE,mean(features_data$Unemployment,na.rm = TRUE),features_data$Unemployment)

sum(is.na(features_data$Unemployment))

# check for NA's in attribute $IsHoliday

sum(is.na(features_data$IsHoliday))

install.packages("Rserve")
library(Rserve);Rserve()

Rserve(port = 6311)

getwd()
getRversion()



