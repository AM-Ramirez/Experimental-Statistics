# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# In this code file, we will be discussing how to use R to compute power of statistical tests. See the readme for more comments on power and why it is important.

# Library
library(pwr)

# Use this package for t-tests, ANOVA, regressions, and proportions to gain maximum power for a test.
# You will typically do this before running an experiment to ensure you have the most powerful test.
# Simply leave the variable in question as NULL to see optimal sample size. 
# Specify what three are (d is effect size, n is per group)
# Typically powers of 80% and higher are preferred.
# If n is a decimal, be sure to round up to the highest level

# The following examples are for two sample t-tests.

# To get Sample Size
pwr.t.test(n=NULL,d=.5,sig.level=.05,power=.8,alternative = "two.sided",type="two.sample")
pwr.t.test(n=NULL,d=-.5,sig.level=.05,power=.8,alternative = "less",type="two.sample")

# To get Power
pwr.t.test(n=50,d=.5,sig.level=.05,power=NULL,alternative = "two.sided",type="two.sample")


# To get effect size know that it is positive so you need greater
pwr.t.test(n=NULL,d=.5,sig.level=.05,power=.8,alternative = "greater",type="two.sample")

# Other tests in this library are
# pwr.anova.test() # ANOVA tests
# pwr.p.test() pwr.2p.test() pwr.2p2n.test() # proportion tests single and same/different sample size
# pwr.chisq.test() # chi square test
# pwr.f2.test() # general linear models
# pwr.norm.test() # normal z-test
# pwr.r.test() # correlation test
# pwr.t2n.test() # t-test different sample sizes