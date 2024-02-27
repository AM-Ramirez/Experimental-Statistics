# Sign Test
This is a non-parametric alternative to the Paire T-Test (where we are evaluating deviation in medians across subjects sampled twice). 

**Assumptions:** subjects are independent and come from a random sample within a fixed population.
**Hypothesis:** 

## Exact Method
If your sample is small enough (or have enough computing power and patience), then you are able to rune an exact measure for this test. In this case we are counting the sign differences between the first recorded value and the second. We will be counting the positive changes between the two. From here, we assume a 0.5 binomial distribution (we should expect 50% of the changes to be positive and 50% to be negative is the null is true). Hence k success would be equal to the number of observations times 0.5. 
