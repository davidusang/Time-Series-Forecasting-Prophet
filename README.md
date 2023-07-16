## Prophet Time Series Forecasting

This repository contains an R script that demonstrates how to use the Prophet library for time series forecasting. Prophet is a robust library developed by Facebook for forecasting time series data. This Readme file provides an overview of the script and explains the steps involved in the forecasting process.
## Table of Contents

- [Dependencies](#dependencies)
- [Usage](#usage)
- [Results](#results)
- [License](#license)

## Dependencies

To run the script, you need to have the following R packages installed:

- prophet
- quantmod
- forecast
- ggplot2
- dplyr

You can install these packages using the `install.packages()` function in R.

## Usage

1 Clone the repository or download the script file.

2 Open the R environment or an R script editor.

3 Install the required packages if they are not already installed:

install.packages(c("prophet", "quantmod", "forecast", "ggplot2", "dplyr"))

## Results

The script provides the following functionality:

    Fetching historical data for the EUR/AUD exchange rate from Yahoo Finance.
    Preprocessing the data and handling missing values.
    Descriptive analysis of the time series data.
    Fitting a Prophet model to the data and generating forecasts.
    Visualizing the model estimates and forecasted values.
    Creating a train prediction dataset for comparison with the real data.
    Performing cross-validation to evaluate the forecast accuracy.
    Visualizing the trend, seasonality, and holiday effects in the forecasted data.

Execute the code step by step or run the entire script:

    The script uses the quantmod package to fetch historical data for the EUR/AUD exchange rate from Yahoo Finance.
    The data is preprocessed and missing values are handled using the na.locf() function.
    Descriptive analysis is performed on the time series data.
    The data is prepared and a Prophet model is fitted to the data.
    Future dates are created for forecasting using the make_future_dataframe() function.
    Forecasts are generated using the predict() function.
    The model estimates and forecasted values are visualized using the dyplot.prophet() function.
    A train prediction dataset is created for comparison with the real data.
    Cross-validation is performed using the accuracy() function to evaluate the forecast accuracy.
    Component analysis is performed to visualize the trend, seasonality, and holiday effects in the forecasted data.

The script produces various plots and outputs to help analyze and understand the time series data.

## License

This script is released under the MIT License.

Feel free to copy the entire content and use it as a README file in your GitHub repository.
