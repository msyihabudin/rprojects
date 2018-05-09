data <- airquality
str(data)

#salah satu cara untuk melihat missing value dengan menggunakan fungsi:
md.pattern(data)

#selain fungsi:
summary(data)

#menghilangkan na pada kolom Solar.R dengan rata-rata 
summary(data$Solar.R)
data$Solar.R[is.na(data$Solar.R)] <- mean(data$Solar.R, na.rm = TRUE)

#menghilangkan na pada kolom Ozon dengan rata-rata
summary(data$Ozone)
data$Ozone[is.na(data$Ozone)] <- mean(data$Ozone, na.rm = TRUE)

#tambah kolom
data$bulan <- NULL
data$bulan[data$Month == 5] <- "Mei"
data$bulan[data$Month == 6] <- "Juni"
data$bulan[data$Month == 7] <- "Juli"
data$bulan[data$Month == 8] <- "Agustus"
data$bulan[data$Month == 9] <- "September"

#Sampling Data
#memilih data yang memiliki nilai atribut month lebih besar dari 7 dan nilai atribut wind lebih besar dari 10.
dataBaru<-data [which(data$Month>7 & data$Wind>=10),]

#memilih data secara random
dataRandom<-data[sample(1:nrow(data),50,replace=FALSE),]

#menggabungkan dataset dibagian kolom, syarat: jumlah baris harus sama
total <- merge(data frameA,data frameB,by="ID")

# menggabungkan 2 dataset secara baris, syarat: jumlah kolom harus sama.
# contoh penggabungan data dari tahap reduksi sampling data > 
dataGabung<- rbind(dataBaru, dataRandom)

#Contoh membagi atribut wind menjadi 3 kelompok
data$Wind<-cut(data$Wind, 3, include.lowest = TRUE)

#Diskretisasi
#contoh melakukan diskretisasi pada atribut sepal dengan membagi menjadi 3 kategori dengan metode equal width
ew.Sepal <- discretize(data$Sepal.Length, "equalwidth", 3)
#contoh melakukan diskretisasi pada atribut petal dengan membagi menjadi 3 kategori dengan metode equal frequency
ef.Petal <- discretize(data$Petal.Length, "equalfreq", 3)