# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/27/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Problem: Linear model to predict sale price based on neighborhood, living area for North Ames (NAmes), 
#           Edwards (Edwards) and Brookside (BrkSide).

## Libraries

library(ggplot2)
library(MASS)

## Data
train.data <- read.csv("C://Users//Alex Ramirez//Desktop//Github Projects//Linear Regression//test//Datasets//train.csv",header = TRUE)

## Data Filtering

# Select the neighborhoods for North Ames, Edwards and Brookside
train.filtered <- train.data[(train.data$Neighborhood == "NAmes" | train.data$Neighborhood == "Edwards" | 
                                train.data$Neighborhood == "BrkSide"), ] 

# Shows that the data has been filtered appropriately
unique(train.filtered$Neighborhood)

## Manipulate Values

# Take the natural log on above ground living area square feet with natual log (may yield a better model fit)
train.filtered$GradeLivingArea = train.filtered$GrLivArea/100
train.filtered$GrLivArea.Log = log(train.filtered$GradeLivingArea)

# Make sales price in terms of thousands, helps with plots take log on the sales price
train.filtered$SalePrice = train.filtered$SalePrice/1000
train.filtered$SalePrice.Log = log(train.filtered$SalePrice)

# Rename the Neighborhoods to make it clear for plots
train.filtered$Neighborhood = ifelse(train.filtered$Neighborhood=="BrkSide","Brookside",
                                     ifelse(train.filtered$Neighborhood=="NAmes","North Ames","Edwards"))

### Assumptions for Linear Regression Model

# Linear Assumption (expect scatter plot to be linear in trend)
#------------------------------------------------------------------------------------------------------
## Linear Linear Model
ggplot(train.filtered, aes(x=GradeLivingArea, y=SalePrice, shape=Neighborhood, color=Neighborhood)) +
  geom_point(size=2) +
  geom_smooth(method=lm, aes(fill=Neighborhood)) +
  ggtitle("Home Prices ('000s) by Grade Living Area per 100sqft") +
  theme_bw() +
  theme(legend.position="bottom", plot.title = element_text(hjust = 0.5)) +
  labs(color='Neighborhood', shape='Neighborhood', fill='Neighborhood')

# Model linear linear
lm.1 <- lm(SalePrice~GradeLivingArea+Neighborhood,data=train.filtered)

# Assumption 2 (Normality of Residuals) & 3 (Constant Variance of Residuals)
par(mfrow=c(2,2))
plot(lm.1)

# Normal Q-Q shows that the majority of the data is normal with slight skew to the right
#   Outlier points to investigate: 643, 725, 1299

# Residuals vs. Fitted shows that we have a few points outside the cluster 
#    Points: 1299, 725, and 643

# Show summary of the model and it's fit
summary(lm.1)

# R Squared is: 0.3965
# Grade Living Area has a statistically significant Coefficient
# North Ames has a statistically significant Coefficient
# Brookside isn't listed as if both are 0, then it calculates for that neighborhood (might imply Edwards is similar)


# Viewing Leverage, Studentized Residuals, and Cook's D / Evaluate that 95% of residuals b/w [-2,2]
# Ensure leverage is below 1 and Cook's D below 1
train.filtered.lm1 <- train.filtered[c("SalePrice","SalePrice.Log","Neighborhood",
                                       "GradeLivingArea")]
train.filtered.lm1 <- transform(train.filtered.lm1, hat = hatvalues(lm.1))
train.filtered.lm1 <- transform(train.filtered.lm1, studres = studres(lm.1))
train.filtered.lm1 <- transform(train.filtered.lm1, cooks = cooks.distance(lm.1))


cleaned.home.data.test <- subset(train.filtered.lm1, SalePrice < 320)
cleaned.home.data <- subset(cleaned.home.data.test, GradeLivingArea < 45)

## Second Model with removed influential points

lm.2 <- lm(SalePrice~GradeLivingArea+Neighborhood,data=cleaned.home.data)

# Assumption 2 (Normality of Residuals) & 3 (Constant Variance of Residuals)
par(mfrow=c(2,2))
plot(lm.2)

# Normal Q-Q shows that the majority of the data is normal with slight skew to the right (Seems more reasonable)

# Residuals vs. Fitted shows a more consistent variance of spread in the data, with it being more clustered around 150 

# Show summary of the model and it's fit
summary(lm.2)

# R Squared is: 0.4988
# Grade Living Area has a statistically significant Coefficient
# North Ames has a statistically significant Coefficient
# Brookside isn't listed as if both are 0, then it calculates for that neighborhood (might imply Edwards is similar)


#-------------------------------------------------------------------------------------------------------
# Due to the potential violation of a constant variance, a log linear model might help address these concerns

### Log Linear Model Example

## Linear Trend
ggplot(train.filtered, aes(x=GradeLivingArea, y=SalePrice.Log, shape=Neighborhood, color=Neighborhood)) +
  geom_point(size=2) +
  geom_smooth(method=lm, aes(fill=Neighborhood)) +
  ggtitle("Log Home Prices ('000s) by Grade Living Area per 100sqft") +
  theme_bw() +
  theme(legend.position="bottom", plot.title = element_text(hjust = 0.5)) +
  labs(color='Neighborhood', shape='Neighborhood', fill='Neighborhood')

# Model log linear
lm.3 <- lm(SalePrice.Log~GradeLivingArea+Neighborhood,data=train.filtered)

# Assumption 2 (Normality of Residuals) & 3 (Constant Variance of Residuals)
par(mfrow=c(2,2))
plot(lm.3)

# Normal Q-Q shows that the majority of the data is normal with slight skew to the right
#   Outlier points to investigate: 725, 534, 1299

# Residuals vs. Fitted shows that we have a few points outside the cluster 
#    Points: 534, 725, and 1299

# Show summary of the model and it's fit
summary(lm.3)

# R Squared is: 0.3981
# Grade Living Area has a statistically significant Coefficient
# North Ames has a statistically significant Coefficient
# Brookside isn't listed as if both are 0, then it calculates for that neighborhood (might imply Edwards is similar)

# Viewing Leverage, Studentized Residuals, and Cook's D / Evaluate that 95% of residuals b/w [-2,2]
# Ensure leverage is below 1 and Cook's D below 1
train.filtered.lm3 <- train.filtered[c("SalePrice","SalePrice.Log","Neighborhood",
                                       "GradeLivingArea")]
train.filtered.lm3 <- transform(train.filtered.lm3, hat = hatvalues(lm.3))
train.filtered.lm3 <- transform(train.filtered.lm3, studres = studres(lm.3))
train.filtered.lm3 <- transform(train.filtered.lm3, cooks = cooks.distance(lm.3))

train.filtered.lm3.leverage <- subset(train.filtered.lm3, hat>=1) # nothing
train.filtered.lm3.cooks <- subset(train.filtered.lm3, cooks>=1) # 1299 identified
train.filtered.lm3.student <- subset(train.filtered.lm3, abs(studres)>2) # 23 obs identified out of 383 ~6% close to 95%

cleaned.home.data2 <- subset(train.filtered.lm3, GradeLivingArea < 50) # Removing observation 1299

# Model log linear
lm.4 <- lm(SalePrice.Log~GradeLivingArea+Neighborhood,data=cleaned.home.data2)

# Assumption 2 (Normality of Residuals) & 3 (Constant Variance of Residuals)
par(mfrow=c(2,2))
plot(lm.4)

# Normal Q-Q shows that the majority of the data is normal with slight skew to the right
#   Outlier points to investigate: 725, 534, 1299

# Residuals vs. Fitted shows that we have a few points outside the cluster 
#    Points: 534, 725, and 1299

# Show summary of the model and it's fit
summary(lm.4)

# R Squared is: 0.449
# Grade Living Area has a statistically significant Coefficient
# North Ames has a statistically significant Coefficient
# Brookside isn't listed as if both are 0, then it calculates for that neighborhood (might imply Edwards is similar)

#-------------------------------------------------------------------------------------------------------
# Examine if an interaction term is reasonable on log linear model for sqft and neighborhood

# Model Log Linear with interaction term
lm.5 <- lm(SalePrice.Log~GradeLivingArea+Neighborhood+GradeLivingArea*Neighborhood,data=cleaned.home.data2)

# Check Plots
par(mfrow=c(2,2))
plot(lm.5)

# Check Summary
summary(lm.5)
# R Squared is: 0.493
# Grade Living Area has a statistically significant Coefficient
# All neighborhoods are statistically significant
# Interaction terms also appear statistically significant

# Extra Sum of Squares Test to see if we should include the interaction term
anova(lm.5, lm.4) # Generates a significant pvalue so, we should use our final model with the interaction term.

