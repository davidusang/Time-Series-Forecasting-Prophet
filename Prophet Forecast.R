# Load required libraries
library(prophet)    # For time series forecasting using Prophet
library(quantmod)   # For retrieving financial data
library(forecast)   # For generating forecasts
library(ggplot2)   # For data visualization
library(dplyr)     # For data manipulation

# Retrieve the dataset from Yahoo Finance
getSymbols("EURAUD=X",
           src = "yahoo", 
           # from = "2000-10-30",
           # to = "2022-04-28", 
           periodicity = "daily")

# Assign the 'Close' prices to the variable 'df'
df <- `EURAUD=X`
df <- Cl(df)
df

# Handle missing values in the time series dataframe
# Apply na.locf function to fill missing values using last observation carried forward (LOCF) method
sum(is.na(df))
df <- na.locf(df, fromLast = TRUE)
df1 <- na.locf(df, fromLast = TRUE)
sum(is.na(df))
sum(is.na(df1))

# Perform a brief descriptive analysis on the time series dataframe
summary(df)
dim(df)
print(df)
#View(Asset)

# Display the first few and last few rows of the dataframe
head(df)
tail(df)

# Create a dataframe for modeling and forecasting
df <- data.frame(ds = index(`EURAUD=X`),
                 y = as.numeric(df$`EURAUD=X.Close`))

# Call the Prophet function and fit the model
prophetpred <- prophet(df, daily.seasonality = TRUE, yearly.seasonality = TRUE)
future <- make_future_dataframe(prophetpred, periods = 252)
tail(future)
sum(is.na(future))
sum(is.na(prophetpred))

# Generate forecasts using the fitted model
forecastprophet <- predict(prophetpred, future)
tail(forecastprophet[c("ds", "yhat", "yhat_lower", "yhat_upper")])

# Visualize the model estimates
dyplot.prophet(prophetpred, forecastprophet)

# Create a prediction dataset to compare with the actual data
dataprediction <- data.frame(forecastprophet$ds, forecastprophet$yhat)
trainlen <- length(df1)
dataprediction <- dataprediction[c(1:trainlen),]

# Perform cross-validation to assess the accuracy of the predictions
accuracy(dataprediction$forecastprophet.yhat, df$y)

# Plot the components of the model
prophet_plot_components(prophetpred, forecastprophet)
