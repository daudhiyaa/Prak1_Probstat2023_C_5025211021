# Poin A
# Jawaban ada di README.md

lambda <- 1.8
x <- 4

# Poin B
probability <- dpois(x=x,lambda=lambda)
probability

# Poin C
probability <- ppois(q=x, lambda=lambda, lower.tail=TRUE)
probability

# Poin D
probability <- ppois(q=x+1, lambda=lambda, lower.tail=FALSE)
probability

# Poin E
nilai_harapan <- lambda
nilai_harapan

standar_deviasi <- sqrt(nilai_harapan)
standar_deviasi

# Poin F
arr <- 0:9
plot(arr, dpois(arr, lambda=lambda),
     type='h',
     main='Histogram Distribusi Poisson',
     xlab='Banyak kematian',
     ylab='Probabilitas'
)

# Poin G
n <- 10
set.seed(1)
ans <- rpois(n=n, lambda=lambda)
ans

# Poin H
# Jawaban ada di README.md