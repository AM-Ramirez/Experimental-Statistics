# Sign Rank Test
This test is another alternative to the Paired T-Test and improves upon the Sign Test by including magnitude to the sign of the differences. 

**Assumptions:** subjects are indpendent, differences are symmetric (not necessarily normal), and randomly sampled.

**Hypothesis:** use the same testing procedures as the sign test and becareful with the continuity correction (two-sided / one-sided)

## Test Statistic
$Z=\frac{s-mean(s)-0.5}{SD(s)}$, where s = sum of the positive ranks}
$mean(s)=\frac{n(n+1)}{4}$
$SD(s) = \sqrt{\frac{n(n+1)(2n+1)}{24}}$
