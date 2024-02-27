# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Paired T-Test: compares location centers of groups (i.e. median)
# Assumptions: observations are independent and y-values are ordinal (can be ranked)
# Strengths: resistant to outliers, and works with censored data


#-------------------------------------------------------------------------------------------------------------------------

# Paired T-Test: for dependent sets of data
# One sample that has been tested twice, pre/post or twins tests
# 
# Differences are normally distributed and independent between observations
# Assumes Normality
#
# Variance of the difference should be smaller due to covariance if it is positively correlated
# H0: difference = 0
# Ha: difference != 0



# $Var(Y_{before}-Y_{after})=\sigma_{before}^2+\sigma_{after}^2-2Cov(Y_{before},Y_{after})$
#   
#   Should result in a smaller variance due to the covariance if positively correlated
# 
# $H_0:\mu_{fatigued-not\space fatigued}=0\text{, }H_a: \mu_{fatigued-not\space fatigued}\ne0$
#   
# Test Statistic: $T=\frac{\bar{d}}{SE(\bar{d})}\text{, where }\bar{d}=\frac{d_1+\dots+d_n}{n}\text{ and }SE(\bar{d})=\frac{s_d}{\sqrt{n}}\text{ and n=# of unique observations i.e. one group}$


side_effect <- read.csv("C:/Users/Alex Ramirez/Desktop/Github Projects/Experimental Statistics/Experimental-Statistics/Two Sample Tests/Paired T Test/Data/side_effect.csv")
side_effect
summary(side_effect)
side_effect$diff <- with(side_effect, Marijuana-Placebo)
t.test(side_effect$diff, alternative='less')
hist(side_effect$diff)
box()
qqnorm(side_effect$diff)
qqline(side_effect$diff)
