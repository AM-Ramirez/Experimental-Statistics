# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Problem: how can we tell if data has a mu at a specific value for any distribution

# Library: 
library(Sleuth2) # R package from textbook The Statistical Sleuth: A Course in Methods of Data Analysis 3rd Edition (Ramsey/Schafer)
#----------------------------------------------------------------------------------------------------------------------------------

# Example one
creativity <- case0101 # creativity data
# Data from an experiment concerning the effects of intrinsic and extrinsic motivation on creativity. 
# Subjects with considerable experience in creative writing were randomly assigned to one of two treatment groups.

# For this problem we will be looking to estimate the population parameter mu in creativity scores. 
# As this has two different groups, we will ignore this for now and just focus on the creativity scores.

# Typically for a t-test we need a large sample size. This code shows you how many observations we have
# There is a lot of debate around what is large. Some texts say greater than 20, some say 35. 
cat("# of observations: ",length(creativity$Score)) # we have 47 observations, which is large.

# Visualize your data. We are looking for relatively normal distributions.
# If our distributions aren't normal adjacent, we will rely on the power of Central Limit Theorem,
#   as xbar should be normally distributed if n is large
hist(creativity$Score) # seems reasonable
qqnorm(creativity$Score) # seems reasonable with a few skewed points
qqline(creativity$Score)

# Run the t.test, using student's t-distribtuion
# H0: mu=15
# Ha: mu!=15
# Alpha=0.05
# Degrees of Freedom (df): Sample size - 1 (47-1=46)
# We use a t.test when sigma is unknown
t.test(creativity$Score, alternative = "two.sided", mu=15,conf.level=0.95)
# Note that we get a significant pvalue and we would reject our null. Typically we have some prior domain knowlege on what mu is in these cases. 

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

# example1 shading to show that the test statistic is extreme / greater than the critical values
shade(df=46,alpha=0.05,h0=15,sides="both",t_calc=3.74)

#--------------------------------------------------------------------------------------------------------

# Example two
# Run the t.test, using student's t-distribtuion
# H0: mu=17
# Ha: mu>17
# Alpha=0.05
# Degrees of Freedom (df): Sample size - 1 (47-1=46)
# We use a t.test when sigma is unknown
t.test(creativity$Score, alternative = "greater", mu=17,conf.level=0.95)
# Note that we do not get a significant pvalue and we would reject our null. 
# Our sample data average is 17.85, so this is relatively close to 17.
shade(df=46,alpha=0.05,h0=17,sides="right",t_calc=1.12)


