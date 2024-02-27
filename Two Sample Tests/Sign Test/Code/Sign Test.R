# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 2/26/2024                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Sign Tests: alternative to the Paired t-test (looks at median)
# Assumptions: subjects are independent and random sample from fixed population
# Strengths: Exact: leverage binomial distribution
#                   Assume .5 binomial distribution is leveraged and find the probability that you can 
#                    have k success in your data
#           Normal Approximation:
#                   Test Statistic: $Z=\frac{K-n/2-0.5}{\sqrt{n/4}}\text{, where n = # of subjects, 
#                    k=# of + differences, and 0.5 is a continuity correction}$
# Lacking: does not account for the magnitude of changes in the data

##Horse Data (Exact using binom.test) 9 observations/subjects
site1 <- c(51, 39, 35, 17, 11, 14, 24, 37, 35)
site2 <- c(38, 19, 23, 19, 7, 16, 14, 38, 24)
site.df <- data.frame(site1,site2)

# Calculate the difference between the two sites
site.df$Diff <- site.df$site1-site.df$site2

# Count the total number of positives
site.df$pos <- ifelse(site.df$Diff>0,1,0)
sum(site.df$pos)

##Sign Test (6 positive differences, 9 subjects)
binom.test(6, 9, alternative='greater')

##Horse Data (Normal Approximaiton)
install.packages("DescTools")
library(DescTools)
SignTest(site1,site2, mu=0,alternative="two.sided") # can change if you require direction
