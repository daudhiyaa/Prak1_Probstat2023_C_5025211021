mean <- 0
s <- 1
n <- 7

# Poin A
# Tentukan nilai t-score
t <- (-2.34 - mean) / (s / sqrt(n))
t

prob <- pt(t, df = 6)
prob

# Poin B
t <- (1.34 - mean) / (s / sqrt(n))
t
prob <- pt(t, df = 6)
prob

# Poin C
# Menghitung t-score
n <- 3
t_score1 <- (1.23 - mean) / (s / sqrt(n))
t_score2 <- (-1.23 - mean) / (s / sqrt(n))

# Menghitung probabilitas menggunakan tabel distribusi t-student
prob1 <- pt(t_score1, df = 3)
prob2 <- pt(t_score2, df = 3)

# Menghitung probabilitas untuk kedua peristiwa acak secara bersamaan
prob_overlap <- pt(1.23, df = 3) - pt(-1.23, df = 3)

# Menghitung probabilitas terjadinya peristiwa acak X kurang dari -1,23 atau lebih besar dari 1,23
prob <- prob1 + prob2 - prob_overlap
prob