#!/bin/bash
str="Долгих Кирилл Сергеевич 22.11.2001 Мирный Республика (Саха) Якутия МБОУ СОШ N12"
for i in {1..50000} 
do 
	echo $str >> IST-021_Dolgikh_LR3_UTF-8.txt
done
iconv -f utf8 -t WINDOWS-1251 IST-021_Dolgikh_LR3_UTF-8.txt -o IST-021_Dolgikh_LR3_1251.txt
iconv -f WINDOWS-1251 -t KOI8 IST-021_Dolgikh_LR3_1251.txt -o IST-021_Dolgikh_LR3_KOI8.txt
iconv -f KOI8 -t CP866 IST-021_Dolgikh_LR3_KOI8.txt -o IST-021_Dolgikh_LR3_866.txt
iconv -f CP866 -t UTF-8 IST-021_Dolgikh_LR3_866.txt -o IST-021_Dolgikh_LR3_UTF-8_End.txt
zip LinuxOut.zip IST-021_Dolgikh_LR3_*
rm IST-021_Dolgikh_LR3_*
