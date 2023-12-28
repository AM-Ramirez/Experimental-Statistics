*# +-------------------------------------------------------------------------------------------------------------------+
*# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
*# \Date: 12/28/2023                                                                                                   |
*# \                                                                                                                   |
*# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
*# \            It is intended to show the work I am capable of and allow others to understand the application in SAS. |
*# +-------------------------------------------------------------------------------------------------------------------+;


***********************;
**Proc Power Examples**;
***********************;

**One sample problems;

**Calculate power for a given effect size (mean), n, and assumed std. dev.;
proc power; 
onesamplemeans 
mean = 8 
ntotal = 150 
stddev = 40 
power = .; 
run; 

**Calculate sample size needed to obtain 80% power for a given effect size (mean) and assumed std. dev.;
proc power; 
onesamplemeans 
mean = 8 
ntotal = . 
stddev = 40 
power = 0.8; 
run; 

**Generate a power curve that shows power for two different effect sizes and two different standard deviations;
**The power curve is calculate for a specified range of sample sizes;
proc power; 
onesamplemeans 
mean = 5 10 
ntotal = 150 
stddev = 30 50 
power = .; 
plot x=n min=100 max=200; 
run; 
