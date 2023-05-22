#!/bin/bash
@echo off
sudo apt-get install arj
sudo apt-get install zoo
sudo apt-get install bzip2
sudo apt-get install gzip
sudo apt-get install rar
sudo apt-get install lhasa

str="Долгих Кирилл Сергеевич 22.11.2001 Мирный Республика (Саха) Якутия МБОУ СОШ N12"
curdir=$(pwd)
for i in {1..50000} 
do 
	echo $str >> IST-021_Dolgikh_LR3_UTF-8.txt
done
iconv -f utf8 -t WINDOWS-1251 IST-021_Dolgikh_LR3_UTF-8.txt -o IST-021_Dolgikh_LR3_1251.txt
iconv -f WINDOWS-1251 -t KOI8 IST-021_Dolgikh_LR3_1251.txt -o IST-021_Dolgikh_LR3_KOI8.txt
iconv -f KOI8 -t CP866 IST-021_Dolgikh_LR3_KOI8.txt -o IST-021_Dolgikh_LR3_866.txt
iconv -f CP866 -t UTF-8 IST-021_Dolgikh_LR3_866.txt -o IST-021_Dolgikh_LR3_UTF-8_End.txt
cat IST-021*LR3*txt > IST-021_Dolgikh_LR3_All.txt

for FILENAME in *LR3*.txt; do
zip "Zipped$FILENAME.zip"  $FILENAME
arj a "Arjed$FILENAME.arj" $FILENAME
rar a "Rared$FILENAME.rar" $FILENAME
zoo -add Zooed$FILENAME.zoo $FILENAME
bzip2 -k -5 $FILENAME > "BZiped$FILENAME.bzip2"
gzip -k -5 $FILENAME > "GZiped$FILENAME.gzip"
lha -af "Lhaed$FILENAME.lzh" $FILENAME
tar -cvf "Tared$FILENAME.tar" $FILENAME
done


