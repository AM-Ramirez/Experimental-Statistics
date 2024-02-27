# Sign Test
This is a non-parametric alternative to the Paire T-Test (where we are evaluating deviation in medians across subjects sampled twice). 

**Assumptions:** subjects are independent and come from a random sample within a fixed population.

**Hypothesis:** 
- $H_0: Y_1-Y_2=0$ where $Y_i,i={1,2}$ are independent.
- $H_a: Y_1-Y_2\ne0$ two sided test
- $\alpha=0.05$

## Exact Method
If your sample is small enough (or have enough computing power and patience), then you are able to rune an exact measure for this test. In this case we are counting the sign differences between the first recorded value and the second. We will be counting the positive changes between the two. From here, we assume a 0.5 binomial distribution (we should expect 50% of the changes to be positive and 50% to be negative is the null is true). Hence k success would be equal to the number of observations times 0.5. 
- $k=$ # of positive differences
- $n=$ # of unique subjects
- $E[Y_1-Y_2]=n(0.5)$

### Process
1. Calculate the differences between $Y_1-Y_2=Z$
2. Count the number of positive differences $d_p$
3. Depending on the hypothesis, you will need to calculate the probability of $d_p$ or more extreme
  - In the Two Sided Case you will need to capture the symetric probabilities, so you can use $2\times P(Z\ge d_p)$ and reject if it is less than $\alpha$ 
