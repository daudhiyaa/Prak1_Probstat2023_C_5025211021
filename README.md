# Prak1_Probstat2023_C_502521021

## Daftar Isi

- ### [Identitas Diri]()
- ### [Nomor 1]()
- ### [Nomor 2]()
- ### [Nomor 3]()
- ### [Nomor 4]()
- ### [Nomor 5]()

### Identitas Diri

| Nama               | NRP        |
| ------------------ | ---------- |
| Daud Dhiya' Rozaan | 5025211021 |

### No 1

Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488. Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran, maka:

- #### Poin A

  Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan parameter yang sesuai.

  Solusi :

  ```
  Distribusi yang sesuai : BINOMIAL.
  Karena kemungkinannya hanya ada 2 yaitu laki2 / bukan laki2. Dan karena terdapat lebih dari 1 kejadian, maka termasuk distribusi Binomial bukan bernouli.

  Parameter :
  n (banyak kejadian) = 10 (kelahiran)
  p (probabilitas) = 0.488

  Rumus : P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)
  ```

- #### Poin B

  Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin laki-laki?

  Solusi :

  Untuk mencari probabilitas suatu titik menggunakan distribusi binomial, kita bisa menggunakan fungsi `dbinom()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `x` = nilai titik yang ingin dicari
  - `size` = banyak percobaan (n)
  - `prob` = nilai probabilitas sukses.

  <br/>

  ```r
  n <- 10
  probability <- dbinom(x=3, size=n, prob=0.488)
  probability
  ```

- #### Poin C

  Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin laki-laki?

  Solusi :

  Untuk mencari probabilitas dalam interval kurang dari suatu titik (berada di sebelah kiri dari suatu titik), kita bisa menggunakan fungsi `pbinom()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `q` = nilai titik batas maksimal
  - `size` = banyak percobaan (n)
  - `prob` = nilai probabilitas sukses.
  - `lower.tail` = boolean. Jika TRUE, maka akan menghitung probabilitas di sebelah kiri dari suatu titik. Jika FALSE, maka akan menghitung probabilitas di sebelah kanan dari suatu titik.

    <br/>

  ```r
  n <- 10
  probability <- pbinom(q=2, size=n, prob=0.488, lower.tail=TRUE)
  probability
  ```

  Nilai q kita set menjadi 2 karena nilai 3 tidak termasuk yang mau kita hitung. Karena dalam hal ini, kita akan menghitung probabilitas kejadian 0, 1, atau 2 bayi laki-laki.

- #### Poin D

  Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin laki-laki?

  Solusi :

  Pada permasalahan kali ini, kita juga akan menggunakan fungsi `pbinom` sama seperti permasalahan 1C, akan tetapi kali ini kita set nilai `lower.tail` menjadi `FALSE`. Atau kita juga bisa mendapatkan solusi nya dengan cara mengurangi 1 dengan jawaban dari permasalahan 1C

  ```r
  n <- 10
  probability <- pbinom(q=3, size=n, prob=0.488, lower.tail=FALSE)
  probability

  # alternatively
  probability <- 1 - pbinom(q=3, size=n, prob=0.488, lower.tail=TRUE)
  probability
  ```

  Kita set nilai q menjadi 3 karena 3 juga ikut dihitung berdasarkan kalimat dari soal.

- #### Poin E

  Berapa nilai harapan dan simpangan baku banyak bayi laki-laki

  Solusi :

  Beberapa rumus pada distribusi binomial :

  - nilai ekspetasi/harapan = n \* p
  - variance = n \* p \* q
  - simpangan baku = sqrt(variance)

  <br/>

  Keterangan :

  - n = banyak percobaan/kejadian
  - p = probabilitas sukses suatu percobaan
  - q = 1-p = probabilitas gagal suatu percobaan

  <br/>

  ```r
  n <- 10
  p <- 0.488
  nilai_harapan <- n * p
  nilai_harapan

  simpangan_baku <- sqrt(n * p * (1-p))
  simpangan_baku
  ```

- #### Poin E

  Gambarkan histogram pendistribusian banyak bayi laki-laki

  Solusi :

  Untuk permasalahan kali ini, kita perlu untuk mengetahui probabilitas tiap titik menggunakan fungsi `dbinom()` yang nantinya akan diplot menggunakan fungsi `plot()`. Karena permasalahan kali ini menyinggung tentang bayi, yang mana nilai titik nya hanya bisa bernilai integer positif dengan range max adalah 10 (kelahiran), maka nilai titiknya hanya 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10. Maka dari itu kita perlu array untuk menampung nilai 0-10 tersebut

  ```r
  arr <- 0:10
  plot(arr, dbinom(x=arr, size=n, prob=p),
     type='h',
     main='Histogram Distribusi Binomial',
     xlab='Banyak bayi laki-laki',
     ylab='Probabilitas'
  )
  ```
