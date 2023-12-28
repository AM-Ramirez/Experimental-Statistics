# Rank Sum Test
This test is a type of non-parametric test, meaning it does not require any distributional assumptions. This allows it to be very flixible, just like the Permutation test. This test compares the location of data between groups (i.e. the medians of the groups rather than the means). 
## Asumptions and Strengths
- **Assumptions:** Observations need to be independent and values must be ordinal (can be ranked)
- **Strengths:** resistant to outliers, and works with censored values (missing values)
## Process
1. $H_0: Median_1-Median_2=0$, alternatively you can say Group1 and Group2 do not differ in location.
2. $H_a: Median_1-Median_2 \ne 0$, alternatively you can say Group1 and Group2 differ in location / Group1 is to the right of Group2 / Group1 is to the left of Group2 
3. $\alpha = 0.05$
4. List observations in increasing order
5. Assign rank from 1 to n and take the average rank for ties
6. **Test Statistic:** $T=\sum\limits_{i=1}^{n_1} R_1$, where $R_1$ is the ranks of one group and $n_1$ is the total observations in that one group
7. **P-value using Normal Approximation:**
  - $\bar{R}$ is the average combined ranks across the two groups.
  - $Mean(T)=n_1\bar{R}$
  - $s_r$ is the sample standard deviation of the combined ranks.
  - $SD(T)=s_r\sqrt{\frac{n_1n_2}{(n_1+n_2)}}$
  - $Z = \frac{T-Mean(T)\pm 0.5}{SD(T)}$, where 0.5 is a continuity correction as we need to capture the full column of data. It can be positive or negative depending on the direction.
  - Be sure to include the confidence interval for the normal approximation.
  - A Hodges-Lehman CI can be calculated easily in SAS (see SAS code in the folder) if you want an exact solution.

## Example
| Metabolic Rate | Reason | Order | Rank |
|----------------|--------|-------|------|
| 18.8           | N      | 1     | 1    |
| 20.0           | N      | 2     | 2    |
| 20.1           | N      | 3     | 3    |
| 20.9           | N      | 4     | 4.5  |
| 20.9           | N      | 5     | 4.5  |
| 21.4           | N      | 6     | 6    |
| 22.0           | T      | 7     | 7    |
| 22.7           | N      | 8     | 8    |
| 22.9           | N      | 9     | 9    |
| 23.0           | T      | 10    | 10   |
| 24.5           | T      | 11    | 11   |
| 25.8           | T      | 12    | 12   |
| 30.0           | T      | 13    | 13   |
| 37.6           | T      | 14    | 14   |
| 38.5           | T      | 15    | 15   |

$T_t=82,T_n=38, \bar{R}=\frac{120}{15}=8,s_r=4.4681$
$Mean(T)=7*8=56,SD(T)=4.4681\sqrt{\frac{7(8)}{(7+8)}}=8.6331$
$Z=\frac{82-56-0.5}{8.6331}=2.9537$
$pval=2\times P(2.9537\le Z)=0.003$
