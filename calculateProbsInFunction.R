rm(list=ls())
set.seed(1)

# (1) Pick the probability p. Pick a sample size n. 
# (2) Simulate the n coin flips experiment and count the number of heads. 
# (3) Convert that to a proportion.

# let's try (1~3) for 1 sample first (each sample has 10 flips)

# For (1)
# sample size
n <- 10

# total number of samples
numSamp <- 1

# flip probability of getting a head
p <- 0.5

# For (2)
# contruct the matrix, with each row = one sample, thus num of col = numSamp
# some of you may prefer to use col representing one sample, which is
# totally fine as well, as long as it's consistent thru your code :D

(coinFlips <- matrix(runif(n * numSamp), nrow = numSamp))

# use < p here, for instance, if your p=0.8, you have higher chance of getting a
# head, that is, in terms of simulation in uniform distribution, you have more values
# falling within [0, 0.8], so a < should be used rather than >. 
# since there is only 1 row, it's essentially an array
(heads <- coinFlips < p)


# for (3)
# proportion of heads
(heads.num <- length(which(heads)))  # count how many TRUE
(prop <- heads.num/n)



#======================== Now, let's increase numSamp =====================

set.seed(1)
# For (1)
n <- 10
numSamp <- 5
p <- 0.5

# For (2)
(coinFlips <- matrix(runif(n * numSamp), nrow = numSamp))
(heads <- coinFlips < p)


# for (3), note this part is changed to adapt to the fact that the matrix coinFlips have more 
# than 1 row now, 
# count number of heads for each row, i.e. each sample
(heads.num <- apply(heads, 1, sum))
# convert to proportion
(prop <- heads.num/n)


#======================== Now, fix numSamp at 1, and change n =====================

# notice that the following chunk of code can be reused by setting different value
# to n
set.seed(1)
# For (1)
n <- 10
p <- 0.5

# For (2)
(coinFlips <- runif(n))
(heads <- coinFlips < p)


# for (3)
(heads.num <- length(which(heads)))  # count how many TRUE
(prop <- heads.num/n)

# thus, we can change them into a customized function, just copy and paste


getHeadProb <- function(n){
  
  set.seed(1)
  
  # For (2)
  (coinFlips <- runif(n))
  (heads <- coinFlips < p)
  
  # for (3)
  (heads.num <- length(which(heads)))  # count how many TRUE
  (prop <- heads.num/n) 
    
}

# ready to try your freshly baked funciton
getHeadProb(10)
getHeadProb(15)
getHeadProb(100) # yeah! closer to p

# so, let's try it on an array of different n values, and apply
# our function on each item of this array via sapply
n.choices <- c(10, 50, 100, 150, 200)
(headProbs  <- sapply(n.choices, getHeadProb))

# then you could plot headProbs


