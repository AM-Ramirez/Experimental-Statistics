# Permutation / Randomization Tests
These tests are very handy as they allow you to simulate different reordering of groups to see if there are significant differences in the averages. This is a type of test that does not rely on distributional assumptions, which makes it very flexible. 
## Process
Let's assume we have two groups of randomly sampled data and we wish to compare their averages. Under our null we will assume that the differences between the groups are zero. Then if the null were true, we could re-order the groups any way we want and still find that the difference would be zero. 

**The Setup:**
- $H_0: \mu_1-\mu_2=0$
- $H_a: \mu_1-\mu_2\ne0$ two sided test
- $\alpha=0.05$
- Calculate the original observed difference in means between the two groups.
- Reorder groups per their original sample size (i.e. if group 1 had 50 and group 2 had 60, their reordering in these groups should stay the same).
- Calculate the average differences and continue this process a large number of times. Given computing power you could do 50,000, 100,000, or more!
- The **p-value** would be the total count of differences greater than the the original observed difference above divided by the number of permutations or reorderings.
### Build Your Own Permutation (BYOP)
In the code file you can see an example on who to build this for yourself from scratch. This can be handy as you can customize it all you want. 
### Leveraging the Coin Package to handle it in One line of code
Additionally, I included an example on how to save some space and leverage this package to handle to permutations. Be sure to lookup the documentation to learn more about this package. 
## Interpretations 
- **Permutation Tests:** refers to this analysis on observational data (groups were not randomly allocated). Note you cannot draw any causal conclusions to this data.
- **Randomization Tests:** referes to randomized expirments where groups are randomly allocated via chance mechanism. Causal inferences can be drawn from this test (i.e. a drug works and a placebo doesn't).
