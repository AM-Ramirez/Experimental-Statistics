# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Problem: how can we tell if data is normally distributed / has a mu at a specific value if normally distributed

# Library: 
library(BSDA) # Gives Z-Test function
#----------------------------------------------------------------------------------------------------------------------

# Example one
set.seed(124) # set a seed to get the same results in our random data
example <- rnorm(100) # generates a 100 sample points from a normal distribution

# visualize your data using Histograms and Q-Q Plots
hist(example) # view the data to see if it looks normal
qqnorm(example) # view the data on a QQ Plot
qqline(example,col="steelblue") # Adds the diagonal line

# Run a z-test on your data (note that we can only run this test because we sampled from a normally distributed sample)
# This means that we knew mu=0 and sigma=1
# H0: mu=0
# Ha: mu!=0 | two sided test
# Alpha = 0.05

z.test(example,alternative="two.sided",mu=0,sigma.x=1,conf.level=0.95)
# Our test generates a large pvalue of 0.9234, hence we fail to reject the null that mu=0
# It is important to note that absence of evidence is not evidence of absence. 

#-------------------------------------------------------------------------------------------------------------------

# Now lets just add 5 to our data and see how that will impact this same analysis
example2 <- example+5
hist(example2) # we can see now our data appears to be centered around 5
qqnorm(example2) # normality in the QQ Plot seems reasonable
qqline(example2,col="steelblue")

# Our test
# H0: mu=0
# Ha: mu!=0 | two sided test
# Alpha = 0.05
z.test(example2,alternative = "two.sided",mu=0,sigma.x=1,conf.level = 0.95)
# We now get a pvalue of 2.2e-16, which is statistically significant
# We also get a Confidence Interval of [4.81,5.21], where we can see mu=0 is not in the range
# While our data may be normally distributed, we have now proved our center (mu) is not zero

#-------------------------------------------------------------------------------------------------------------------

# If you want a fun way to visualize the shading in your analysis please use the following function code

#' Credit: Volodymyr Orlov
#' https://github.com/VolodymyrOrlov/MSDS6371/blob/master/shade.r

#' Draws a t-distribution curve and shades rejection regions
#' 
#' @param df degrees of freedom.
#' @param alpha significance level
#' @param h0 null hypothesis value
#' @param sides one of: both, left, right
#' @param t_calc calculated test statistics
#' @examples
#' shade(49, 0.05, 0, t_calc=1.1)
shade <- function(df, alpha, h0 = 0, sides='both', t_calc=NULL) {
  e_alpha = alpha
  if(sides == 'both'){
    e_alpha = alpha / 2
  }
  cv = abs(qt(e_alpha, df))
  curve(dt(x, df), from = -4, to = 4, ylab='P(x)', xaxt='n') 
  abline(v = 0, col = "black", lwd = 0.5)
  labels = h0
  at = 0
  if(sides == 'both' | sides == 'left'){
    x <- seq(-4, -abs(cv), len = 100) 
    y <- dt(x, df)
    polygon(c(x, -abs(cv)), c(y, min(y)), col = "blue", border = NA)
    lines(c(-cv, -cv), c(0, dt(-cv, df)), col = "black", lwd = 1)
    text(-cv - (4 - cv) / 2, 0.05, e_alpha)
    labels = c(round(-cv, 3), labels)
    at = c(-cv, at)
  }
  if(sides == 'both' | sides == 'right'){
    x <- seq(abs(cv), 4, len = 100)
    y <- dt(x, df)
    polygon(c(abs(cv), x), c(min(y), y), col = "blue", border = NA)
    lines(c(cv, cv), c(0, dt(cv, df)), col = "black", lwd = 1)
    text(cv + (4 - cv) / 2, 0.05, e_alpha)
    labels = c(labels, round(cv, 3))
    at = c(at, cv)
  }
  if(is.numeric(t_calc)){
    abline(v = t_calc, col = "red", lwd = 2)
    text(t_calc + 0.5, 0.2, t_calc, col = "red")
  }
  axis(1, at=at, labels=labels)
}

# This is set to a t-test, but simply enter a large enough df and t_calc will be your z-test statistic
# example1 shading to show that the test statistic is not extreme / greater than the critical values
shade(999999999,alpha=0.05,h0=0,sides="both",t_calc=0.09206)
