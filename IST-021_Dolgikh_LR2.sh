echo "Долгих Кирилл Сергеевич 22.11.2001 Мирный Республика (Саха) Якутия МБОУ СОШ №12 " > IST021-Dolgikh_LR2_UTF-8.txt
iconv -f utf8 -t WINDOWS-1251 IST-Dolgikh_LR2_UTF-8.txt -o IST021-Dolgikh_LR2_1251.txt
iconv -f WINDOWS-1251 -t KOI8 IST-Dolgikh_LR2_1251.txt -o IST021-Dolgikh_LR2_KOI8.txt
iconv -f KOI8 -t CP866 IST-Dolgikh_LR2_KOI8.txt -o IST021-Dolgikh_LR2_866.txt
iconv -f CP866 -t UTF-8 IST-Dolgikh_LR2_866.txt -o IST021-Dolgikh_LR2_UTF-8_End.txt
zip LinuxOut.zip IST021-Dolgikh_LR2_*
rm IST021-Dolgikh_LR2_*
