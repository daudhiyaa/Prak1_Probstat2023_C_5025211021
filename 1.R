# Poin A
# Jawaban ada di README.md

n <- 10
p <- 0.488

# Poin B
probability <- dbinom(x=3, size=n, prob=p)
probability

# Poin C
probability <- pbinom(q=2, size=n, prob=p, lower.tail=TRUE)
probability

# Poin D 
probability <- pbinom(q=2, size=n, prob=p, lower.tail=FALSE)
probability

# Poin E
nilai_harapan <- n * p
nilai_harapan

simpangan_baku <- sqrt(n * p * (1-p))
simpangan_baku

# Poin F
arr <- 0:10
plot(arr, dbinom(x=arr, size=n, prob=p), 
     type='h',
     main='Distribusi Binomial',
     xlab='Banyak bayi laki-laki',
     ylab='Probabilitas'
)