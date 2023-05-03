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
  main = "Grafik Histogram"
)

# Poin C
mean <- v
mean

variance <- 2 * v
variance