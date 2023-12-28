# T-Tests
These tests run analysis on $\mu$ using the Student's T distribution. In practice, we may rarely encounter normally distributed data or know what the $\sigma$ is for the population. This allows us to test potential values for $\mu$ given some prior domain knowledge (expert knowledge).
## Assumptions and Notation
- **Sigma:** is unknown.
- **Mu:** is unknown and we wish to approximate it.
- **Sample Size:** N is large (greater than 20, 30, or 35)
- **Degrees of Freedom:** df = Sample Size - 1
- **Sample Average:** $\bar{x}=\frac{\sum\limits_{i=1}^N x_i}{N}$
- **Sample Standard Deviation:** $s=\sqrt{\frac{\sum\limits_{i=1}^N(x_i-\bar{x})^2}{N-1}}$, where N = Sample Size
- **Test Statistic:** $t^*$ is derived by $frac{\bar{x}-\mu_0}{s/\sqrt{N}}$
- **Central Limit Theorem:** $\bar{X}~N(\mu_x,\frac{\sigma_x}{\sqrt{N}}$
  - If you randomly sample your data, as sample size increases, then your sample average tends to be normally distributed.
- **Random Sample:** observations were randomly sampled and independent
## Approach
- Visualize your data using histograms and Q-Q plots to show normallity or that CLT is robust to the assumptions if sample size is large
- State null and alternative hypotheses with significance level
- Calculate your degrees of freedom, sample average, sample standard deviation, test statistic, critical values, and p-value
- Reject or fail to reject your null hypothesis
- Conclude your findings and state confidence interval
