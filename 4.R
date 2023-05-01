n <- 100
mean <- 45
sd <- 5

# Poin A
set.seed(1)
data <- rnorm(n, mean, sd)
data
summary(data)

z_score <- (data-mean(data))/sd(data)
z_score

x1 <- runif(1, min = min(data), max = mean)
x2 <- runif(1, min = mean, max = max(data))

probability1 <- pnorm(x1, mean, sd)
probability2 <- pnorm(x2, mean, sd)

probability <- probability2 - probability1
probability
plot(data)

# Poin B
breaks <- 50
hist(data, breaks, main = "Normal Distribution Histogram")

# Poin C
variance <- sd(data) ^ 2
variance