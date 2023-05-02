# Poin A
X <- -2.34
df <- 6
probA <- pt(X, df=df, lower.tail = TRUE)
probA

# Poin B
X <- 1.34
df <- 6
probB <- pt(X, df=df, lower.tail = FALSE)
probB

# Poin C
X <- -1.23
df <- 3
probC <- 2 * (pt(X, df=df, lower.tail = TRUE))
probC

# Poin D
X <- -0.94
df <- 14
probD <- pt(abs(X), df=df) - pt(X, df=df)
probD

# Poin E
area <- 0.0333
df <- 5
tscore_E <- qt(area, df, lower.tail = TRUE)
tscore_E

# Poin F
area <- 0.125
df <- 25
tscore_F <- qt(area, df, lower.tail = FALSE)
tscore_F

# Poin G
area <- 0.75
x <- (1-area)/2 + area
df <- 11
tscore_G <- qt(x, df)
tscore_G

# Poin H
area <- 0.0333
x <- 1 - (area/2)
df <- 23
tscore_H <- qt(x, df)
tscore_H