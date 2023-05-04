# <div align="center"><p>Prak1_Probstat2023_C_5025211021</p></div>

## Daftar Isi

[Identitas Diri](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#identitas-diri-1) | [Nomor 1](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#no-1) | [Nomor 2](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#no-2) | [Nomor 3](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#no-3) | [Nomor 4](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#no-4) | [Nomor 5](https://github.com/daudhiyaa/Prak1_Probstat2023_C_502521021#no-5)

## Identitas Diri

| Nama               | NRP        |
| ------------------ | ---------- |
| Daud Dhiya' Rozaan | 5025211021 |

## No 1

Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488. Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran, maka:

- ### Poin A

  Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan parameter yang sesuai.

  #### Solusi :

  ```
  Distribusi yang sesuai : BINOMIAL
  Karena kemungkinannya hanya ada 2 yaitu laki2 / bukan laki2 dan terdapat lebih dari 1 kejadian.

  Parameter :
  n (banyak kejadian) = 10 (kelahiran)
  p (probabilitas) = 0.488

  Rumus : P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)
  ```

- ### Poin B

  Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin laki-laki?

  #### Solusi :

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

  #### Hasil :

  ![1B](https://user-images.githubusercontent.com/90663569/235987892-2d5128c9-dfcd-4cdb-ae07-365374ff70c9.png)

- ### Poin C

  Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin laki-laki?

  #### Solusi :

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

  #### Hasil :

  ![1C](https://user-images.githubusercontent.com/90663569/235987994-270dc716-f86e-40a5-9155-8fdf41008591.png)

- ### Poin D

  Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin laki-laki?

  #### Solusi :

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

  #### Hasil :

  ![1D](https://user-images.githubusercontent.com/90663569/235988058-35dcb33e-44d8-4513-8dd9-98d014f83dc1.png)

- ### Poin E

  Berapa nilai harapan dan simpangan baku banyak bayi laki-laki

  #### Solusi :

  Beberapa rumus pada distribusi binomial :

  - nilai ekspetasi / harapan = n \* p
  - variance = n \* p \* q
  - standar deviasi / simpangan baku = sqrt(variance)

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

  #### Hasil :

  ![1E](https://user-images.githubusercontent.com/90663569/235988112-8079596a-69fc-4d1a-81df-aacb0b1f657d.png)

- ### Poin F

  Gambarkan histogram pendistribusian banyak bayi laki-laki

  #### Solusi :

  Untuk permasalahan kali ini, kita perlu untuk mengetahui probabilitas tiap titik menggunakan fungsi `dbinom()` yang nantinya akan diplot menggunakan fungsi `plot()`. Karena permasalahan kali ini menyinggung tentang bayi, yang mana nilai titik nya hanya bisa bernilai integer positif dengan range max adalah 10 (kelahiran), maka nilai titiknya hanya 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10. Maka dari itu kita perlu array untuk menampung nilai 0-10 tersebut

  ```r
  arr <- 0:10
  plot(arr, dbinom(x=arr, size=n, prob=p),
      type='h',
      main='Histogram Distribusi Banyak Bayi Laki-laki',
      xlab='Banyak bayi laki-laki',
      ylab='Probabilitas'
  )
  ```

  #### Hasil :

  ![1F](https://user-images.githubusercontent.com/90663569/235988146-747fecd1-71ed-415e-b0e9-b00a81811647.png)

## No 2

Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik ban dalam 20 tahun ke depan adalah 1.8, maka:

- ### Poin A

  Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan distribusi dengan parameter yang sesuai.

  #### Solusi :

  ```
  Distribusi yang sesuai : POISSON
  Karena terjadi dalam suatu interval waktu atau ruang tertentu.

  Parameter :
  λ (rata-rata banyak kejadian dalam interval waktu atau ruang tertentu) = 1.8

  Rumus : P(X=k) = e^(-1.8) (1.8^k / k!)
  e adalah bilangan Euler (2,71828...)
  ```

- ### Poin B

  Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas berdasarkan distribusi yang telah dipilih

  #### Solusi :

  Peristiwanya tergolong tidak biasa. Untuk menghitung probabilitasnya menggunakan distribusi poisson, kita bisa menggunakan fungsi `dpois()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `x` = nilai titik yang ingin dicari
  - `lambda` = rata-rata banyak kejadian (λ)

  <br/>

  ```r
  probability <- dpois(x=4,lambda=1.8)
  probability
  ```

  #### Hasil :

  ![2B](https://user-images.githubusercontent.com/90663569/235988181-7e14a61e-32b1-4fe7-a08c-b3bb597c6d50.png)

- ### Poin C

  Berapa peluang paling banyak 4 kematian akibat kanker tulang?

  #### Solusi :

  Untuk menyelesaikan permasalahan ini, kita bisa menggunakan fungsi `ppois()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `q` = nilai titik batas maksimal
  - `lambda` = rata-rata banyak kejadian (λ)
  - `lower.tail` = boolean. Jika TRUE, maka akan menghitung probabilitas di sebelah kiri dari suatu titik. Jika FALSE, maka akan menghitung probabilitas di sebelah kanan dari suatu titik.

  <br/>

  ```r
  probability <- ppois(q=4, lambda=1.8, lower.tail=TRUE)
  probability
  ```

  #### Hasil :

  ![2C](https://user-images.githubusercontent.com/90663569/235988379-041ea38e-26dd-49fc-a1a0-7ca9d9bbe453.png)

- ### Poin D

  Berapa peluang lebih dari 4 kematian akibat kanker tulang?

  #### Solusi :

  Sama seperti permasalahan 2C, kita bisa menggunakan fungsi `ppois()` tapi kita set nilai `lower.tail` menjadi FALSE.

  ```r
  probability <- ppois(q=5, lambda=1.8, lower.tail=FALSE)
  probability
  ```

  Kita set nilai `q` menjadi 5 karena di soal diminta peluang lebih dari 4, maka 4 tidak termasuk.

  #### Hasil :

  ![2D](https://user-images.githubusercontent.com/90663569/235988418-ccafd108-1d8a-4ad4-ab6d-adb56ad6a4e5.png)

- ### Poin E

  Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?

  #### Solusi :

  Beberapa rumus pada distribusi binomial :

  - nilai ekspetasi / harapan = λ
  - standar deviasi / simpangan baku = sqrt(nilai harapan)

  <br/>

  ```r
  nilai_harapan <- lambda
  nilai_harapan

  standar_deviasi <- sqrt(nilai_harapan)
  standar_deviasi
  ```

  #### Hasil :

  ![2E](https://user-images.githubusercontent.com/90663569/235988464-fffe87a4-2783-48b0-9e56-c33068f5ba6c.png)

- ### Poin F

  Gambarkan histogram pendistribusian banyak kematian akibat kanker tulang untuk pekerja pabrik ban.

  #### Solusi :

  Untuk permasalahan kali ini, kita perlu untuk mengetahui probabilitas tiap titik menggunakan fungsi `dpois()` yang nantinya akan diplot menggunakan fungsi `plot()`. Karena permasalahan kali ini menyinggung tentang kematian, yang mana nilai titik nya hanya bisa bernilai integer positif dengan range hingga 8 (kematian) (karena di atas 8 nilai probabilitasnya sudah 0), maka nilai titiknya hanya 0, 1, 2, 3, 4, 5, 6, 7, 8. Maka dari itu kita perlu array untuk menampung nilai 0-8 tersebut

  ```r
  arr <- 0:9
  plot(arr, dpois(arr, lambda=1.8),
       type='h',
       main='Histogram Distribusi Poisson',
       xlab='Banyak kematian'
       ylab='Probabilitas',
  )
  ```

  #### Hasil :

  ![2F](https://user-images.githubusercontent.com/90663569/235988520-6ca4f8c8-ca2c-4639-9d76-a0bf366420a0.png)

- ### Poin G

  Gunakan simulasi untuk memeriksa hasil sebelumnya

  #### Solusi :

  Untuk membuat simulasi, kita dapat menggunakan fungsi `rpois()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `n` = jumlah sampel yang dihasilkan
  - `lambda` = rata-rata banyak kejadian (λ)

  <br/>

  Fungsi `rpois()` di bahasa R digunakan untuk menghasilkan sampel bilangan bulat dari distribusi Poisson dengan parameter lambda yang diberikan. Fungsi ini menghasilkan bilangan bulat yang menggambarkan jumlah kejadian dalam interval waktu atau ruang tertentu, di mana kejadian tersebut terjadi secara acak dengan tingkat rata-rata lambda dalam interval yang sama.

  ```r
  n <- 10
  set.seed(1)
  ans <- rpois(n=n, lambda=1.8)
  ans
  ```

  kita gunakan `set.seed()` agar sampel yang digenerate selalu sama.

  #### Hasil :

  ![2G](https://user-images.githubusercontent.com/90663569/235988585-770927fe-00d6-4fa8-a825-7333cc6b8dbd.png)

- ### Poin H

  Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda. Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda

  #### Solusi :

  ```
  Menurut jawaban dari simulasi poin 2G, terlihat bahwa nilai yang digenerate terletak dalam range 0-4.
  Jika kita tidak gunakan fungsi `set.seed()`, maka akan terlihat bahwa nilai yang digenerate memiliki presentase lebih besar berada dalam range 0-4,
  yang berarti nilai tersebut memiliki peluang yang lebih besar karena tetap berada dekat dengan lambda yakni 1,8.

  Sampel dari simulasi poin 2G tersebut membuktikan jawaban dari poin 2D
  bahwa probabilitas kematian diatas 4 memiliki nilai yang kecil.
  ```

## No 3

Diketahui nilai x = 3 dan v = 10.

- ### Poin A

  Fungsi Probabilitas dari Distribusi Chi-Square

  #### Solusi :

  Solusi dari permasalahan ini adalah kita dapat menggunakan distribusi chi-square dan kita menggunakan bantuan dari fungsi `dchisq()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `x` = total data
  - `v` = bilangan bulat positif

  <br/>

  ```r
  x <- 3
  v <- 10
  probability <- dchisq(x, v)
  probability
  ```

  #### Hasil :

  ![3A](https://user-images.githubusercontent.com/90663569/235988657-e92eaf9c-0449-47ed-9716-b6126419510e.png)

- ### Poin B

  Histogram dari Distribusi Chi-Square dengan 500 data acak

  #### Solusi :

  Untuk membuat histogram, kita membutuhkan bantuan dari fungsi `hist()` dengan parameter fungsi random chi-square `rchisq()`.

  ```r
  n <- 500
  v <- 10
  # set.seed(1)
  hist(
    rchisq(n, v),
    xlab = "X",
    ylab = "V",
    main = "Histogram Distribusi Chi-Square 500 Data Acak"
  )
  ```

  Jika ingin data yang sama setiap kali generate, maka dapat menggunakan fungsi `set.seed()`

  #### Hasil :

  ![3B](https://user-images.githubusercontent.com/90663569/235988726-5ea90d89-e8b0-403e-82a6-c2489417babd.png)

- ### Poin C

  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square

  #### Solusi :

  Penyelesaian dari masalah ini adalah menggunakan rumus mean = v dan varian = 2 \* v.

  ```r
  mean <- v
  mean

  variance <- 2 * v
  variance
  ```

  #### Hasil :

  ![3C](https://user-images.githubusercontent.com/90663569/235988786-c1afb613-5b8c-4271-b61d-bb9ed8d1143a.png)

## No 4

Diketahui data bangkitan acak sebanyak 100 dengan mean = 45 dan sd = 5. Tentukan:

- ### Poin A

  Fungsi probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung z-scorenya dan plot data bangkitan acaknya dalam bentuk grafik. Petunjuk (gunakan fungsi plot()).

  ```
  Keterangan :
  X1 = Bilangan bulat terdekat di bawah rata-rata
  X2 = Bilangan bulat terdekat di atas rata-rata

  Contoh data :
  11
  1,2,4,2,6,3,10,11,5,3,6,8
  rata-rata = 5.083333
  X1 = 5
  X2 = 6
  ```

  #### Solusi :

  Untuk menyelesaikan permasalahan ini langkah pertama yang perlu dilakukan adalah kita perlu menghasilkan data - data yang diperlukan dari data yang tersedia menggunakan bantuan fungsi `rnorm()` yang mana parameternya adalah `n`, `mean`, dan `sd`.

  Langkah berikutnya kita membutuhkan bantuan fungsi `runif()` untuk memperoleh random deviates dari `max(data)` dan `min(data)`. Hasil dari random deviates tadi kemudian menjadi parameter dari fungsi `rnorm()` yang mana digunakan untuk mencari probabilitas yang ditanyakan. Sedangkan untuk plot data dalam bentuk grafik kita dapat menggunakan fungsi `plot()` dengan parameter `data`.

  Untuk menghitung z-scorenya, kita dapat menggunakan persamaan (data-mean(data)) / sd(data)

  ```r
  n <- 100
  mean <- 45
  sd <- 5

  # set.seed(1)
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
  ```

  Jika ingin data yang sama setiap kali generate, maka dapat menggunakan fungsi `set.seed()`

  #### Hasil :

  ![4A](https://user-images.githubusercontent.com/90663569/235988909-23cfd4da-b4c4-448b-a477-642b75b33c3c.png)

- ### Poin B

  Gambarkan histogram dari distribusi Normal dengan breaks 50

  #### Solusi :

  Untuk membuat histogram kita membutuhkan fungsi `hist()` yang isi parameternya adalah `data` dan `breaks` yang mana diketahui dari soal.

  ```r
  breaks <- 50
  hist(data, breaks, main = "Normal Distribution Histogram")
  ```

  #### Hasil :

  ![4B](https://user-images.githubusercontent.com/90663569/235988978-8e521681-0279-4e21-9b47-519bd5d399b7.png)

- ### Poin C

  Nilai varian (σ²) dari hasil data bangkitan acak distribusi Normal

  #### Solusi :

  Untuk mendapatkan varian kita memerlukan bantuan dari fungsi `sd()` yang parameternya `data` kemudian hasil dari fungsi itu kita kuadratkan.

  ```r
  variance <- sd(data) ^ 2
  variance
  ```

  #### Hasil :

  ![4C](https://user-images.githubusercontent.com/90663569/235989066-9e385705-6bc2-4b94-8437-e45497302af1.png)

## No 5

Kerjakanlah menggunakan distribusi T-Student

- ### Poin A

  Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan 6 derajat kebebasan?

  #### Solusi :

  Untuk mendapatkan probabilitas menggunakan distribusi T-Student, kita dapat menggunakan fungsi `pt()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `q` = nilai titik batas maksimal
  - `df` = degrees of freedom (derajat kebebasan)
  - `lower.tail` = boolean. Jika TRUE, maka akan menghitung probabilitas di sebelah kiri dari suatu titik. Jika FALSE, maka akan menghitung probabilitas di sebelah kanan dari suatu titik.

  <br/>

  ```r
  X <- -2.34
  df <- 6
  probA <- pt(q=X, df=df, lower.tail = TRUE)
  probA
  ```

- ### Poin B

  Berapa probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6 derajat kebebasan?

  #### Solusi :

  Mirip dengan penyelesaian permasalahan 5A, kita dapat menggunakan fungsi `pt()`. Akan tetapi, perbedaannya adalah kita set nilai `lower.tail` menjadi `FALSE` karena kita akan menghitung probabilitas daerah kanan dari (lebih dari) suatu titik.

  ```r
  X <- 1.34
  df <- 6
  probB <- pt(q=X, df=df, lower.tail = FALSE)
  probB
  ```

- ### Poin C

  Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau lebih besar dari 1,23 dengan 3 derajat kebebasan?

  #### Solusi :

  Karena grafik distribusi t-student berbentuk lonceng simetris, maka luas kanan & kiri dari titik pusat sama luasnya. Maka untuk permasalahan kali ini, kita bisa menyelesaikannya dengan menghitung salah satu luasan dan mengalikannya dengan 2

  ```r
  X <- -1.23
  df <- 3
  probC <- 2 * (pt(X, df=df, lower.tail = TRUE))
  probC

  # alternatively
  X <- 1.23
  df <- 3
  probC <- 2 * (pt(X, df=df, lower.tail = FALSE))
  probC
  ```

- ### Poin D

  Berapa probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94 dan 0,94 dengan 14 derajat kebebasan?

  #### Solusi :

  Kita dapat menghitung luasan ke kiri dari titik positif (0.94) dikurangi dengan luasan ke kiri dari titik negatif (-0.94), akan menghasilkan luasan antara titik -0.94 dan absolutnya

  ```r
  X <- -0.94
  df <- 14
  probD <- pt(abs(X), df=df) - pt(X, df=df)
  probD
  ```

- ### Poin E

  Berapa nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut?

  #### Solusi :

  Pada permasalahan kali ini, yang dicari adalah nilai t-scorenya dengan diketahui `df` dan luasan / probabilitasnya. Kita dapat menggunakan fungsi `qt()` pada bahasa R yang memerlukan beberapa parameter yaitu :

  - `x` = luasan / nilai probabilitas
  - `df` = degrees of freedom (derajat kebebasan)
  - `lower.tail` = boolean. Jika TRUE, maka akan menghitung t-score di sebelah kiri dari suatu titik. Jika FALSE, maka akan menghitung t-score di sebelah kanan dari suatu titik.

  <br />

  ```r
  area <- 0.0333
  df <- 5
  tscore_E <- qt(area, df, lower.tail = TRUE)
  tscore_E
  ```

- ### Poin F

  Berapa nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125 satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut?

  #### Solusi :

  Mirip dengan permasalahan poin 5E, akan tetapi, kali ini kita set nilai `lower.tail` menjadi `FALSE` karena kita akan menghitung t-score daerah kanan dari (lebih dari) suatu titik.

  ```r
  area <- 0.125
  df <- 25
  tscore_F <- qt(area, df, lower.tail = FALSE)
  tscore_F

  # alternatively
  area <- 0.125
  df <- 25
  tscore_F <- qt(1 - area, df, lower.tail = TRUE)
  tscore_F
  ```

- ### Poin G

  Berapa nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75 satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari nilai t-score tersebut?

  #### Solusi :

  Luasan dibawah kurva dan didalam range t-score & negatifnya adalah 0.75, maka luasan sisanya adalah 1 - 0.75 = 0.25. Dan karena T-student berbentuk simteris, maka luasan di kanan maupun di kiri adalah 0.25 / 2 = 0.125. Kita perlu mencari nilai t-score yang memiliki luasan 0,125 tersebut.

  ```r
  area <- 0.75
  x <- (1 - area) / 2
  df <- 11
  tscore_G <- qt(x, df = df, lower.tail = FALSE)
  tscore_G
  ```

- ### Poin H

  Berapa nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan negatif dari nilai t-score tersebut

  #### Solusi :

  Mirip dengan solusi pada permasalahan poin 5G, akan tetapi kali ini kita kalikan 0.5 terlebih dahulu area yang diketahui untuk mengetahui luasan dikanannya saja. Setelah mengetahuinya, kita dapat mengurangi 1 dengan luasan kanan tersebut untuk mengetahui luasa dari t-score hingga ke kiri / minus tak hingga

  ```r
  area <- 0.0333
  x <- 1 - (area/2)
  df <- 23
  tscore_H <- qt(x, df)
  tscore_H
  ```

### Hasil :

![5](https://user-images.githubusercontent.com/90663569/235989196-f7c989f2-4787-46a2-b741-573f9d9c9e90.png)

![no5](https://user-images.githubusercontent.com/90663569/235989224-3a6de933-e70b-4950-927c-1d09dad3d7ae.png)

# <div align="center"><p> Sekian dan Terima Kasih</p></div>
