x <- 3
v <- 10

# Poin A
probability <- dchisq(x, v)
probability

# Poin B
# set.seed(1)
n <- 500
hist(
  rchisq(n, v), 
  xlab = "X", 
  ylab = "V", 
  main = "Histogram Distribusi Chi-Square 500 Data Acak"
)

# Poin C
mean <- v
mean

variance <- 2 * v
variance