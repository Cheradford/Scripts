#!/bin/bash
file="IST-021_Dolgikh_LR4a_"
IFS="\n"
rm "$file"*
rm "New"*
iconv -f WINDOWS-1251 -t CP866 "IST-021_Dolgikh_LR3_1251.txt" -o "$file""CP866.txt"
iconv -f CP866 -t WINDOWS-1251 "IST-021_Dolgikh_LR3_866.txt" -o "$file""WINDOWS-1251.txt"
for code in WINDOWS-1251 CP866
do
	for str in $(cat "$file""$code"".txt");
		do
			str=$(echo $str | iconv -f $code -t UTF-8)
			str=$(echo $str | sed "y/абвгдезийклмнопрстуфы/abvgdeziiklmnoprstufy/")
			str=$(echo $str | sed "y/АБВГДЕЗИЙКЛМНОПРСТУФЫ/ABVGDEZIIKLMNOPRSTUFY/")
			str=$(echo $str | sed "s/ч/ch/g" | sed "s/Ч/CH/g")
			str=$(echo $str | sed "s/ж/zh/g" | sed "s/Ж/ZH/g")
			str=$(echo $str | sed "s/х/kh/g" | sed "s/Х/KH/g")
			str=$(echo $str | sed "s/ц/ts/g" | sed "s/Ц/TS/g")
			str=$(echo $str | sed "s/ш/sh/g" | sed "s/Ш/SH/g")
			str=$(echo $str | sed "s/щ/shch/g" | sed "s/Щ/SHCH/g")
			str=$(echo $str | sed "s/ъ/ie/g" | sed "s/Ъ/IE/g")
			str=$(echo $str | sed "s/ю/iu/g" | sed "s/Ю/IU/g")
			str=$(echo $str | sed "s/я/ia/g" | sed "s/Я/IA/g")
			str=$(echo $str | tr [:lower:] [:upper:])
			str=$(echo $str | sed "y/ABCEHKMOPTX/АВСЕНКМОРТХ/")
			str=$(echo $str | iconv -f UTF-8 -t $code)
			echo "$str" >> "New""$file""$code"".txt"
		done
done
zip IST-021_Dolgikh_KS_LR4a.zip *IST-021*LR4a*
