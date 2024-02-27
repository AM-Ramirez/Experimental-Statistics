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

# Sign Rank Test: alternative the Paired t-test and includes magnitude to Sign Test (looks at median)

# Assumptions: subjects are independent, differences are symmetric (not necessarily normal), and randomly selected

site1 <- c(51, 39, 35, 17, 11, 14, 24, 37, 35)
site2 <- c(38, 19, 23, 19, 7, 16, 14, 38, 24)
site.df <- data.frame(site1,site2)
site.df$Diff <- site.df$site1-site.df$site2
site.df$pos <- ifelse(site.df$Diff>0,1,0)
sum(site.df$pos)

install.packages("coin")
library(coin)

wilcoxsign_test(site1 ~ site2, distribution = "exact", alternative = "greater")
