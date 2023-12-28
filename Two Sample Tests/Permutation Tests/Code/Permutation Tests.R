# +-------------------------------------------------------------------------------------------------------------------+
# \Author: Alex Ramirez Master's in Applied Statistics Student at Southern Methodist University                       |
# \Date: 12/28/2023                                                                                                   |
# \                                                                                                                   |
# \Copy right: This code isn't intended to be copied or leveraged for any academic school work at any institution.    |
# \            It is intended to show the work I am capable of and allow others to understand the application in R.   |
# +-------------------------------------------------------------------------------------------------------------------+

# Permutation and Randomization Tests
# These test hold no assumptions, but we need to clarify that there is a difference in interpretation given the experiments. 
# A randomization test is where groups were randomly allocated to groups in the study. Thus, you can conclude causal inference.
# A permutation test is where groups were not randomly assigned or cannot be randomly assigned (i.e. gender). This means we cannot draw causal conclusions to the groups.

# Libraries
library(Sleuth2) # R package from textbook The Statistical Sleuth: A Course in Methods of Data Analysis 3rd Edition (Ramsey/Schafer)
library(coin) # built in permutation test

# Creativity Data from Sleuth
creativity <- case0101

# With these tests there are 2 options: build your own permutation test or leverage a pre-built perm function (Coin package)

#----------------------------------------------------------------------------------------------------------------------

# Build your own permutation test

##Define how many permutations you want / pick a large number
number_of_permutations <- 50000

##Create an empty vector to store the permuted averages
xbarholder <- numeric(0)

##Initialize a counter to see how many differences exceed the observed differences
counter <- 0

##Define the observed difference (there are multiple ways to do this)
observed_diff <- mean(subset(creativity, Treatment == "Intrinsic")$Score)-mean(subset(creativity, Treatment == "Extrinsic")$Score)


##Create a 'for' loop that carries out our simulation
for(i in 1:number_of_permutations)
{
  
  ##Randomly sample 47 creativity scores without replacement, which is equivalent to randomly reordering them
  scramble <- sample(creativity$Score, 47)
  
  ##Assign the randomly reordered scores to extrinsic and intrinsic
  extrinsic <- scramble[1:23]
  intrinsic <- scramble[24:47]
  
  ##Calculate the new observed difference in means
  diff <- mean(intrinsic)-mean(extrinsic)
  
  ##Store this difference in our previously empty created vector
  xbarholder[i] <- diff
  
  ##Decide whether our permuted difference is more extreme than the actual observed difference; if so, bump up the counter
  if(abs(diff) > observed_diff)
    counter <- counter + 1
}

##Create a histogram of all observed differences
hist(xbarholder)

##Calculate our p-value
pvalue <- counter / number_of_permutations
cat("P-value from test:", pvalue) # note this is less than alpha=0.05, so we would reject the null
# Stating there is a difference in creativity scores between the intrinsic and extrinsic groups

##View only the permuted differences that were more extreme than the observed
xbarholder[which(abs(xbarholder)>observed_diff)] # only due this if you want to see the extreme differences
cat("# of Extreme differences: ",length(xbarholder[which(abs(xbarholder)>observed_diff)]))

#--------------------------------------------------------------------------------------------------------------------

# Leveraging the Coin Package and saving finger exercise

##Use a pre-built permutation test function from the coin package
oneway_test(Score ~ Treatment, data=creativity, alternative="two.sided", 
            distribution = approximate(nresample = 50000), conf.level=0.95)

