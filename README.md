## soal1




Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump
  1) unzip file nature.zipyang ada di praktikum1 di simpan  tujuan direktori praktikum 1
           ```unzip /home/awin/praktikum1/nature.zip -d /home/awin/praktikum1```
           
  2) membuat direktori hasil dalam folder nature. Iterasi untuk memandai foto 1-n, foto yang disimpan akan diberinama pict dan disimpan dalam array, lalu di decrypt menggunakan base64 lalu dibuat formatnya disimpan dalam direktori hasil dengan nama pict-(sesuai urutan) 
       ```/home/awin/praktikum1/nature/hasil
      iter = 0
       
      for pict in /home/awin/praktikum1/nature/*.jpg
       
       do
       
       base64 -d $pict | xxd -r > /home/awin/praktikum1/nature/hasil/$iter.jpg
       iter=$((iter+1))
      done```
       
  3) menginstall crontab
      pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
       
       ```14 14 14 2 5 /bin/bash /home/awin/praktikum1/no1.sh
       13 14 * 2 5 /bin/bash /home/awin/praktikum1/no1.sh```
       ```
       
       
       ![alt text](https://lh3.googleusercontent.com/L1RJASFH2oQQT_kL-ULddLFzro4f5rqagJXHgqnkMQ0M1D4R0tloe10HH0YP9BD9EgIun3SQUJQFcK4SaemI=w1299-h630)
       
## Soal2

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file     WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
  1) Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
    awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1 
    → akan mengaktifkan awk, awk bisa digenerate menjadi laporan yang berformat dan awk mempunyai operator aritmatika dan string.
    
    if($7 == '2012')-> mencari data yang mengandung tahun “2012” iter[$1]+=$10-> {$10} kolom ke-10.Karena di soal diminta untuk   mencari penjualan terbanyak, maka quantity berada pada kolom ke-10. 
    {for(hasil in iter)->kemudian nama variable “iter” tersebut disimpan dalam hasil
    {print hasil}}->mencetak hasil WA_Sales_Products_2012-14.csv, nama file yang berformat csv
    sort -nr 
    head -1 -> menampilkan output bagian pertama dari file (dengan out put satu baris saja yang diminta)

 2) Tentukan tiga product line yang memberikan penjualan(quantity)terbanyak pada soal poin a.
    
    ```awk -F ',' '{if($7 == '2012' && $1 == "United States") p[$4]+=$10} END 
    {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'
    → akan mengaktifkan awk, awk bisa digenerate menjadi laporan yang berformat dan awk mempunyai operator aritmatika dan string.
    if($7 == '2012')-> mencari data yang mengandung tahun “2012” 
    $1 == "United States->mencari negara yang sama dengan poin 2 a
    p[$4]+=$10 -> {$10} artinya adalah kolom ke-10. Hasil data yang dicari akna disimpan dalam array yang bernama p
    for(hasil in p) -> kemudian nama variable “p” tersebut disimpan dalam hasil
    
    WA_Sales_Products_2012-14.csv -> nama file yang berformat csv
    sort -nr -> mengurutkan hasil dalam bentuk file 
    awk 'NR<=3 {print $2,$3}' -> akan ditampilkan data kedua dan ketiga teratas```
    
  3) Tentukan tiga product yang memberikan penjualan(quantity)
    terbanyak berdasarkan tiga product line yang didapatkan pada soalpoin 
    
    echo "Outdoor Protection"
    awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,3$,4$}’
    → program yang berfungsi dengan nomor 2b dan dengan suatu kondisi bahwa program akan mengecek apakah data sesuai dengan product line “Outdoor Protection”  dan akan menampilkan data ke-2, ke-3,dan ke-4

    echo "Camping Equipment"
    awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") p[$6]+=$10} END {for(hasil in p) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}’
    → program yang berfungsi dengan nomor 2b dan dengan suatu kondisi bahwa program akan mengecek apakah data sesuai dengan product line "Camping Equipment" dan akan menampilkan data ke-2, ke-3, dan ke-4

    echo "Personal Accesories"
    awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") p[$6]+=$10} END {for(hasil in c) {print p[hasil], hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2$,$3,$4}’
  → program yang berfungsi dengan nomor 2b dan dengan suatu kondisi bahwa program akan mengecek apakah data sesuai dengan product line"Personal Accesories" dan akan menampilkan data ke-2, ke-3, dan ke-4.
       ![alt text](https://lh5.googleusercontent.com/oLYZ3R47XRNPsblP5SDHFvMFzhmtBPiSRqkEwpb7B_Vb7NN9fGHMNnj0Zurjpy1llgtiesxQceqUYJgR2Cjt=w1299-h630)


## soal3
Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
       Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus. Password yang dihasilkan tidak boleh sama.
 

```#!/bin/bash

uuid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1) ->syntax untuk pembuatan password yang diacak 12 length 

# echo $uuid

file="password"
ext=".txt"

counter=1
flag=1

for passtxt in password/password*.txt->melakukan for ketika ada sembarang file yang diawali dengan password bla-bla-bla.txt akan dilakukan perintah
do
    path="password/password$counter.txt"->disimpan di direktori password, dan penamaan sesuai urutan saat di bash
    #echo "${passtxt:17:1}"
    if [[ "*" == ${passtxt:17:1} ]]
    then
        echo "Still empty, so create new file password$counter.txt" ->di cek dulu, karena belum ada list maka ditampilkan ketika    baru pertama kali bash 
        echo "$uuid" > $path->dibuat password yang dimasukkan ke path
        flag=0
        break
    elif [[ counter -ne ${passtxt:17:1} ]] 
    then
        echo "password$counter.txt not available, create new file"->dicek dulu dan list, ketika belum ada file
        echo "$uuid" > $path-> dibuat password yang dimasukkan ke path
        flag=0
        break
    else
        echo "password$counter.txt available"->
    fi
counter=$((counter + 1))->increment penamaan password
done

if [[ flag -eq 1 ]]
then
    path="password/password$counter.txt"->disimpan di direktori password
    echo "password$counter.txt not available, create new file"->password yang dibuat di akhir 
    echo "$uuid" > $path
fi
```
 ![alt text](https://lh3.googleusercontent.com/aKfw5EnQAWCj2YpUqF4qtC1QT03o8sePaYnNL8UL3FIfxgTvjDjTdNLjIwuKE-FLkwe7Yrup3rOx0PiWjaKq=w1299-h630)

 ![alt text](https://lh3.googleusercontent.com/CJIBCjxb8-6ZCejSi1KXdEpVidW_V5MEXBoLra_mGFNYYGVh_FVhFJIqWU6x01OL-5k73OnVxQlSSgb1o_J6=w1299-h630)



## soal4
  Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan      konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
   Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. setelah huruf z akan kembali ke huruf a. Backup file syslog setiap jam. dan buatkan juga bash script untuk dekripsinya.
   enkripsi
   ```
  #!/bin/bash

hour=$(date +"%H")

if [[ ${hour:0:1} -eq 0 ]]
then
    hour=${hour:1:1}
fi

#echo $hour

lowcase=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
syslog=$(</var/log/syslog)
#echo "$syslog"
syslog=$(echo "$syslog" | tr "${lowcase:0:26}" "${lowcase:${hour}:26}")
#echo "$syslog"

upcase=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
syslog=$(echo "$syslog" | tr "${upcase:0:26}" "${upcase:${hour}:26}")
#echo "$syslog"

thishour=$(date +"%H:%M %d-%m-%Y")
#echo "$thishour"

echo "$syslog" > syslog/"$thishour"

   ```
   dekripsi
   
   ```
   #!/bin/bash
i=1
for syslog in syslog/*
do
    echo "$i. ${syslog##*/}"
    choose[i]=${syslog##*/}
    i=$((i + 1))
done

echo "Please choose which one you want to decrypt(in number)>>"
read this
hour=$((${choose[this]:0:1}*10))
hour=$((hour+${choose[this]:1:1}))
echo $hour
dec=$((26-hour))

echo $dec
lowcase=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
syslog=$(<syslog/"${choose[this]}")
#syslog="$syslog${choose[this]}"
#echo "$syslog"
syslog=$(echo "$syslog" | tr "${lowcase:0:26}" "${lowcase:${dec}:26}")
#echo "$syslog"

upcase=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
syslog=$(echo "$syslog" | tr "${upcase:0:26}" "${upcase:${dec}:26}")
#echo "$syslog"

#echo "$thishour"
echo "$syslog" > dec/"${choose[this]}.dec"

  
  pengaturan crontab:
  
  0 * * * * /bin/bash /home/awin/praktikum1/no4.sh
  ```
  
   ![alt text](https://lh4.googleusercontent.com/jLA1WHCVDXr6el9GFfvn3E2-Psc6r3ZOQ3wJ3rwuZ7El9eBVixo3Dnr1sMewsaqUPAs8yZ-L408GC3MZw_0B=w1299-h630)
## soal5
Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi  	kriteria berikut:

         Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1 Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
    awk '/cron/ || /CRON/→string cron,!/sudo→tidak mengandung string sudo/' /var/log/syslog | 	awk 'NF < 13'  →number of field kurang dari 13>> 	/home/awin/modul1/syslogno5.log → disimpan/dimasukkan dlm direktori ini

    pengaturan crontab:
    2-30/6 * * * * /bin/bash /home/awin/praktikum1/no5.sh ->script tadi setiap 6 menit dari 	menit ke 2 hingga 30,
    
    
   ![alt text](https://lh3.googleusercontent.com/3BYpeD9muEkomJQ7HeRXGe2A8Rj2nRDxUEq9K9FEgv5dSMsIxn_fUZ9kVbjWmzgMwJZujDrXv5W-JUTJnze8=w1299-h630)
    ![alt text](https://lh5.googleusercontent.com/-QuFm6yAb-SPiWapG1Lf4DjtMk6MGeKL7FK8k-iUZ2CqjKHHHwQX4_eubKPFsXtdhkt32QNnry1b3eBLWZId=w1299-h630)
   
