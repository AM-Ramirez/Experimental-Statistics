# Linear Regression Example
In this folder you will see how to easily create a linear regression model in R. When creating a linear model, it is important to note the assumptions and transformations to ensure you model operates as planned. 
## Overview
### Variables
- Y is called the dependent or response variable.
- X is caled the independent, regressor, or predictor variable.
- Error should be random and sometimes called noise, where we should expect it's average to be zero with a constant variance.
- Residuals are the actual Ys - Predicted Values.
- Beta are the coefficients in your model.
- Interaction Terms: one predictor variable impact on another predcitor variable is related to the dependent variable. Said another way, the slope of one predicotr changes based on the value of another predictor varialble.
  - Run an Extra Sum of Squares test (ESS test) to see if the interaction term is reasonalbe. This is done simply by fitting two models (one with and one without) and running an ANOVA test to see if it is statistically significant. 
### Random vs. Observational Experiments
- **Random Sampled Data:** We can generalize to the population of interest as sample was randomly collected. For these examples, we will assume a random sample was conducted.
- **Random:** A one unit increase in X causes the mean number in Y to increase by $\beta$, where groups are randomly allocated. Causal conclusions can be concluded.
- **Observational:** For any population of the groups with similar average Xs, a unit increase in X is associated with $\beta$ increase in mean Y. Causal conclusions ***cannot*** be concluded.
### Model Fit
- **R Squared:** measures how well your model fits the sample data
  - Can always be made 1 if you add more explanatory variables (i.e. adding X squared, X cubed, ..., till the number of predictors equals the sample size).
- **Root Mean Squred Error (RMSE):** evaluates model's predictive strength or how close the predicted values are to the real values. 
## Linear Model Assumptions
- **Linearity:** use scatter plots to show how your variables are visually trended (a linear trend should be expected: upwards, downwards or flat).
- **Normality:** use a Q-Q plot of the residuals (predicted vs. actuals) or a historgram (expect normal view).
- **Constant Variance:** plot the residuals vs. fitted values (would expect a cloud of points equidistant from the center).
- **Independence:** this was from a random sample.
## Transformations
- **Log - Linear Models:** where the predicted variable (Y) is logged, evaluates the median in Y, and we can interpret an increase in X is a multiplicative change of $e^{\beta}$ in median Y given X.
- **Linear - Log Models:** where the predictor variable (X) is logged, evaluates the mean in Y, and we can interpret a doubling of X resulting in a $\beta log(2)$ unit increase in the mean of Y.
- **Log - Log Models:** where both Y and X are logged, evaluates median in Y given median in X, and we can increpret a doubling of log(X) resulting in a $2^\beta$ multiplicative increase in the median of Y.
## Influential Points 
- **Leverage:** how far away X values are from their sample means. Look for values greater than 1 or $\frac{2p}{n}$ where p is the number of predictors and n is the number of observations in your data.
- **Studentized Residuals:** how far Y values are from their sample means. 95% of your observations should fall between -2 and 2.
- **Cook's D:** blend of leverage and studentized residuals. Look for values of 1 or higher.
- In practice, there is debate over removing observations from your data is valid. Keep in mind that these techniques can be leverage to get better model fit and potentially better model predictions.
## Collinearity / Multicollinearity
- **Definition:** 2 or more predictor variables are correlated with each other
- Leverage a correlation matrix to see, which variables might be telling you the same information, as it is difficult to understand their effects on the response variable. You may even get no statistically significant paramters, parameters with incorrect signs, or estimates with implausible magnitude. Worst case would not being able to acheive a numerical solution.
- **Variance Inflation Factor:** measures collinearity for each predictor variable, be sure to center your data if you leverage this approach.

# Penalized Linear Regression Example
Traditional linear regression explained above minimizes the sum of the squared residuals, but it may not always generate the most accurate model. To acheive improvements on accuracy, penalized regression techniques should be used. 
## Techniques
- **Ridge Regression:** causes shrinkage, which introduces bias in our model (this can be a good thing as it reduces the variance of predictions). We call the penalty lambda ($\lambda$).
- **LASSO:** this also causes shrinkage, but it also can reduce betas coefficients to zeros to perform variable selection. Also uses $\lambda$.
- **Elastic Net:** think of this as a blend of both Ridge and Lasso. This uses $\lambda$ and alpha ($\alpha$), where $\alpha$ is between zero and one. The closer one, it performs more similar to LASSO. Conversely, closer to zero performs similarly to Ridge.


# Data
I have included the data following data and data description from Kaggle[https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques]. If you wish to learn more about this data click the link and try your best. 
