# Reading the features dataset file
features_data <- read.table("Features_data_set.csv", header = TRUE, sep = ",")

str(features_data)

# Reading the sales data file
sales_data <- read.csv("sales_data.csv", header = TRUE, sep = ",")

str(sales_data)

# Reading the stores data file
stores_data <- read.csv("stores_data_set.csv", header = TRUE, sep = ",")
str(stores_data)

# merge the stores.csv file and sales.csv file by $Store
df_1 <- merge(sales_data,stores_data, by = "Store")

head(df_1)

# Merge the features_data with df_1 by common attributes $Store, $Date, $IsHoldiay
df_2 <- merge(df_1,features_data, by = c("Store", "Date", "IsHoliday"))
head(df_2)

sum(is.na(df_2))

# creating a function to calculate the mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# calculate mode of the attribute Store
mode_Store <- getmode(df_2$Store)
mode_Store

# substitute NA value sin attribute Store by its mode
df_2$Store <- ifelse(is.na(df_2$Store) == 'TRUE', mode_Store, df_2$Store)

sum(is.na(df_2$Store))

# calculate mode of Date
mode_Date <- getmode(df_2$Date)
mode_Date

# substitute NA values in attribute Date by its mode
df_2$Date <- ifelse(is.na(df_2$Date) == 'TRUE', mode_Date, df_2$Date)


# calculate mode of attribute Dept
mode_Dept <- getmode(df_2$Dept)
mode_Dept

# substitute NA values in attribute Dept by its mode
df_2$Dept <- ifelse(is.na(df_2$Dept) == 'TRUE', mode_Dept, df_2$Dept)
sum(is.na(df_2$Dept))

# calculate mode of attribute Type
mode_Type <- getmode(df_2$Type)
mode_Type

# substitute NA values in attribute Type by its mode
df_2$Type <- ifelse(is.na(df_2$Type) == 'TRUE', mode_Type, df_2$Type)
sum(is.na(df_2$Type))

# check for NA's in attribute $MarkDown1
sum(is.na(df_2$MarkDown1))


#substitute NA values in attribute MrkDown1 by its mean
df_2$MarkDown1 <- ifelse(is.na(df_2$MarkDown1) == TRUE,mean(df_2$MarkDown1, na.rm = TRUE),df_2$MarkDown1)

sum(is.na(df_2$MarkDown1))

# check for NA's in attribute $MarkDown2
sum(is.na(df_2$MarkDown2))

#substitute NA values in attribute MarkDown2 by its mean
df_2$MarkDown2 <- ifelse(is.na(df_2$MarkDown2) == TRUE,mean(df_2$MarkDown2, na.rm = TRUE),df_2$MarkDown2)

sum(is.na(df_2$MarkDown2))

# check for NA's in attribute $MarkDown3
sum(is.na(df_2$MarkDown3))

#substitute NA values in attribute MarkDown3 by its mean
df_2$MarkDown3 <- ifelse(is.na(df_2$MarkDown3) == TRUE,mean(df_2$MarkDown3, na.rm = TRUE),df_2$MarkDown3)

sum(is.na(df_2$MarkDown3))


# check for NA's in attribute $MarkDown4
sum(is.na(df_2$MarkDown4))

#substitute NA values in attribute MarkDown4 by its mean
df_2$MarkDown4 <- ifelse(is.na(df_2$MarkDown4) == TRUE,mean(df_2$MarkDown4, na.rm = TRUE),df_2$MarkDown4)

sum(is.na(df_2$MarkDown4))


# check for NA's in attribute $MarkDown5
sum(is.na(df_2$MarkDown5))

#substitute NA values in attribute MarkDown5 by its mean
df_2$MarkDown5 <- ifelse(is.na(df_2$MarkDown5) == TRUE,mean(df_2$MarkDown5, na.rm = TRUE),df_2$MarkDown5)

sum(is.na(df_2$MarkDown5))

# check for NA's in attribute $CPI

df_2$CPI <- as.numeric(df_2$CPI)
sum(is.na(df_2$CPI))
#substitute NA values in attribute CPI by its mean
df_2$CPI <- ifelse(is.na(df_2$CPI) == TRUE,mean(df_2$CPI,na.rm = TRUE),df_2$CPI)
sum(is.na(df_2$CPI))

# check for NA's in attribute $Unemployment
sum(is.na(df_2$Unemployment))
#substitute NA values in attribute Unemployment by its mean
df_2$Unemployment <- ifelse(is.na(df_2$Unemployment) == TRUE,mean(df_2$Unemployment,na.rm = TRUE),df_2$Unemployment)
sum(is.na(df_2$Unemployment))

#substitute NA values in attribute Weekly_Sales by its mean
df_2$Weekly_Sales <- ifelse(is.na(df_2$Weekly_Sales) == TRUE,mean(df_2$Weekly_Sales,na.rm = TRUE),df_2$Weekly_Sales)
sum(is.na(df_2$Weekly_Sales))

#substitute NA values in attribute Fuel_Price by its mean
df_2$Fuel_Price <-ifelse(is.na(df_2$Fuel_Price) == TRUE,mean(df_2$Fuel_Price,na.rm = TRUE),df_2$Fuel_Price)
sum(is.na(df_2$Fuel_Price))

#substitute NA values in attribute Temperature by its mean
df_2$Temperature <-ifelse(is.na(df_2$Temperature) == TRUE,mean(df_2$Temperature,na.rm = TRUE),df_2$Temperature)
sum(is.na(df_2$Temperature))

#substitute NA values in attribute Size by its mean
df_2$Size <-ifelse(is.na(df_2$Size) == TRUE,mean(df_2$Size,na.rm = TRUE),df_2$Size)
sum(is.na(df_2$Size))

# Check for any remaining NA values in the dataframe df_2
sum(is.na(df_2))

# Change datatype of attribute IsHoliday to numeric and change it 0 if it is not a holiday and 1 if it is
df_2$IsHoliday <- as.numeric(df_2$IsHoliday)
df_2$IsHoliday <- ifelse(df_2$IsHoliday == 'True',1,0)

# Get mode of attribute IsHoiday
mode_holiday <- getmode(df_2$IsHoliday)

#Replace NA values in attribute IsHoliday by its mode
df_2$IsHoliday <- ifelse(is.na(df_2$IsHoliday) == TRUE,mode_holiday,df_2$IsHoliday)
sum(is.na(df_2$IsHoliday))

sum(is.na(df_2))

str(df_2)
typeof(df_2$IsHoliday)



# Selecting the relevant numeric attributes from the df_2 dataframe
df_3 <- df_2[, c("Weekly_Sales","Fuel_Price","Temperature","MarkDown1","MarkDown2","MarkDown3"
                 ,"MarkDown4","MarkDown5","Unemployment","CPI")]
head(df_3)
 
# creating the multiple linear regression model
fit <- lm(Weekly_Sales ~ Fuel_Price + Temperature + MarkDown1 + MarkDown2 + MarkDown3 + MarkDown4
           + MarkDown5 + Unemployment + CPI, data = df_3) 
fit
 
# Getting the intercept value
a <- coef(fit)[1]
a
#Getting the value of all the coefficients of all the attributes from the model
 
 b <- coef(fit)[2]
 b
 
 b1 <- coef(fit)[3]
 b1
 
 b2<- coef(fit)[4]
 b2
 
 b3 <- coef(fit)[5]
 b3
 
 b4 <- coef(fit)[6]
 b4
 
 b5 <- coef(fit)[7]
 b5
 
 b6 <- coef(fit)[8]
 b6
 
 b7 <- coef(fit)[9]
 b7
 
 b8 <- coef(fit)[10]
 b8
 
 
 


