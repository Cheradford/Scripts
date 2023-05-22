
@echo off
chcp 65001 > nul
set var="Долгих Кирилл Сергеевич 22^.11^.2001 Мирный Республика ^(Саха^) Якутия МБОУ СОШ ^№12"
<nul Set /P "string=%var%" > IST021-Dolgikh_LR2_UTF-8.txt
chcp 1251 > nul
<nul Set /P "string=%var%" > IST021-Dolgikh_LR2_1251.txt
chcp 20866 > nul
<nul Set /P "string=%var%" > IST021-Dolgikh_LR2_KOI8-R.txt
chcp 866 > nul
<nul Set /P "string=%var%" > IST021-Dolgikh_LR2_866.txt
tar -a -c -f Archive.zip IST021-Dolgikh_LR2_*
del IST021-Dolgikh_LR2_*
