# Power
Power is exactly what it sounds like. This allows us to evaluate the strength of a statistical test (i.e. the ability to reject the null hypothesis). 
As a reminder we have called $\alpha$ our significance level, but it actually measure the probability of rejecting the null hypothesis if the null is true. Said simply, we are allowing our test to fail 5% of the time, also referred to as type one error. To make this easier, we will plot this in a matrix.
## Error Matrix
|             | Do not Rejct Null | Reject Null     |
|-------------|-------------------|-----------------|
| Null = True | Correct Outcome   | $\alpha$ = Type1|
| Null = False| $\beta$ = Type2   | Correct Outcome |

From the table, we can easily see that we want to rejct the null when it is false and want to fail to reject when it is true. Our mathematical defintion of power will now be $Power=1-\beta$. This means that **power is the probabilty of rejecting the null when the null is false**.

## Power Features
- **Effect Size:** this is the numerical measurement of the strength of an event. Typically you can think of this as the size difference between the test statistics and hypothesis. It is similar to how sensitive your test will react.
- - For example, the difference between a null $\mu=0$ and $\bar{x}=100$. We would expect a large difference in effect size.
- **Sample Size:** the number of observations in your sample. As gain larger samples, your power should increase due to the robustness of central limit theorem. It will also impact effect size, making the test more sensitive to smaller changes in the null assumptions.
- **Standard Deviation:** the variation in your data will either increase or decrease your power. A tighter range of values, makes it easier to reject the null as effect size will increase. 
- **Significance Level:** if $\alpha$ measures our ability to reject the null when the null is true, a larger value gives the test a higher chance of rejecting the null even when it is true. 
## Influences on Power
- $\alpha \text{ and } \beta$ are inversely related. As one increases the other decreases.
  - This means that $\alpha$ and Power are positively correlated. As one increases the the other increases.
- As standard deviation decreases, standard error decreases, and power increases.
- AS sample size decreases, power decreases.
- As effect size increases, power increases.

## Comments on the Code File
In the code file you will only see examples for two-sample t-tests. I have included the functions for other power tests in comments, but be sure to explore other alternatives as R does not cover all necessary applications of power. SAS may be another reasonable software to get more meaningful power analysis. 
