# heightPredictor
shiny app for predicting child height aging curves

## Height prediction data

The data used for this app come from the Centers for Disease Control, and consist of averages of childrens' heights in the United States for each half month age interval.

More information can be found here:

https://www.cdc.gov/growthcharts/

The data files used can be downloaded from these links:

https://www.cdc.gov/growthcharts/data/zscore/zlenageinf.csv

https://www.cdc.gov/growthcharts/data/zscore/zstatage.csv

## Using the app

To use the app, click on the tab you are interested in for prediction: either the 0 to 36 month infant height predictor or the 2 to 20 year child height predictor.

Select a gender, enter a height (in cm or inches), and select an age when that height was recorded. After you hit submit, the app will display a predicted height aging curve from 0 to 36 months or from 2 to 20 years, whichever tab you selected, and will also display the predicted height for your inputs at either 36 months or at 20 years, again based on your tab selection.

##How it works
The app takes the inputs you enter, calculates the number of standard deviations from the mean that input represents, and plots the points equal to that standard deviation from the mean height at each half-month age. The predicted height calculates and returns the height an equal number of standard deviations from the mean at either 36 months of age or 20 years of age.
