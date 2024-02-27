# Paired T-Test
This test is done on dependent data sets, where one sample has been tested twice. Common examples include pre/post tests and twin studies. The measure is the difference in the pre and post recordings.

**Assumptions:** require data to be normally distributed / CLT can apply on large data sets.

## Hypothesis on Side Effect Data
Data located in the respective folder. 

$H_0:\mu_{fatigued-not\space fatigued}=0$

$H_a: \mu_{fatigued-not\space fatigued}\ne0$

$\alpha =0.05$

## Test Statistic
$T=\frac{\bar{d}}{SE(\bar{d})}\text{, where }\bar{d}=\frac{d_1+\dots+d_n}{n}\text{ and }SE(\bar{d})=\frac{s_d}{\sqrt{n}}\text{ and n= number of unique observations i.e. one group}$

**Note:** Difference should result in a smaller variance due to the covariance if positively correlated

$Var(Y_{before}-Y_{after})=\sigma_{before}^2+\sigma_{after}^2-2Cov(Y_{before},Y_{after})$

## Code
The code in this section leverages a standard t.test on the differences between pre and post evaluations.
