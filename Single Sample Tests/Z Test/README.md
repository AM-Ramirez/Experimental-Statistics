# Z-Tests
In the case you are sampling from a normally distributed population, you may want to run a hypothesis test to see if the center ($\mu$) sits at zero or a specified value. 
## Assumptions
- **Sigma:** is known ($\sigma$), also called the population standard deviation
- **Mu:** is unknown ($\mu$), also called the population expected value
- Samples drawn from normally distributed population
- Observations are independent of one another
## Visualizations:
- Leverage histograms and Q-Q Plots
## Hypothesis Test Notation
### Two-Sided
- $H_0: \mu=0$ | Null Hypothesis
- $H_a: \mu \ne 0$ | Alternative Hypothesis (two sided)
- $\alpha=0.05$ significance level (95% confident)
### One-Sided Tests
- $H_a: \mu > 0$ | Alternative Hypothesis (one-sided)
- $H_a: \mu < 0$ | Alternative Hypothesis (one-sided)
### Process
1. State your Null and Alternative hypotheses with significance level
2. Calculate the test statistic $\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}$, where n is the sample size.
3. Calculate the critical values (i.e. if $alpha=0.05$ then for a two-sided test we need to calculate the z-value for 0.025 and 0.9725 |-1.96 and 1.96)
4. Calculate the p-value (probability greater than our test statistic | $P(X>z^*)$, where z-star is our test statistic)
5. Reject null if p-value is less than $\alpha$ (test statistic will also be greater/less than critical value)
6. Conclude your findings with confidence interval
