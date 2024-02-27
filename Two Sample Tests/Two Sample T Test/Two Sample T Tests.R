# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Rank Sum Tests: compares location centers of groups (i.e. median)
# Assumptions: observations are independent and y-values are ordinal (can be ranked)
# Strengths: resistant to outliers, and works with censored data


#-------------------------------------------------------------------------------------------------------------------------

# Two Sample T-Test

# Note that your grouping variable MUST be a factor
# Data for a new vs. traditional teaching methods
method <- factor(c(rep('New', 4), rep('Trad', 3)))
scores <- c(37, 49, 55, 77, 23, 31, 46)
teaching <- data.frame(method, scores)


wilcox_test(scores ~ method, data=teaching, alternative='greater', conf.level=0.95, distribution='exact')

#----------------------------------------------------------------------------------------------------------------------

#Rank Sum Normal Approximation
wilcox_test(scores ~ method, data=teaching, alternative='greater',conf.int=T, conf.level=0.95, distribution='approximate')

