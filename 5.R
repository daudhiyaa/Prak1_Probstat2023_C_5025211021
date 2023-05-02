mean <- 0
s <- 1
n <- 7

# Poin A
# P(X < a) = pt((a - μ) / (s/√n), df=n-1)
a <- -2.34
t <- (a - mean) / (s / sqrt(n))
t

probA <- pt(t, df = n-1)
probA

# Poin B
# P(X > a) = 1 - pt((a - μ) / (s/√n), df=n-1)
a <- 1.34
t <- (a - mean) / (s / sqrt(n))
t

probB <- 1 - pt(t, df = n-1)
probB

# Poin C
# P(|X| > a) = 2 * (1 - pt(|a|, df=n-1))
df <- 3
a <- 1.23
probC <- 2 * (1 - pt(abs(a), df))

# Poin D
# P(|X| > a) = 1 - (2 * (1 - pt(|a|, df=n-1)))
df <- 14
a <- 0.94
probD <- 1 - (2 * (1 - pt(abs(a), df)))

# Poin E
area <- 0.0333
df <- 5
tscore_E <- qt(x, df)
tscore_E

# Poin F
area <- 1 - 0.125
df <- 25
tscore_F <- qt(area, df)
tscore_F

# Poin G
x <- 0.75 + ((1-0.75)/2)
df <- 11
tscore_G <- qt(x, df=df)
tscore_G

# Poin H
x <- 1 - (0.0333/2)
df <- 23
tscore_H <- qt(x, df=df)
tscore_H