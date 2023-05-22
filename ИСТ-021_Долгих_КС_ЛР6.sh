#!/bin/bash

count=1
Path_to_dir="/var/www/html"
PhotoIn="${Path_to_dir}/PhotoIn/"
PhotoOut="${Path_to_dir}/PhotoOut/"
PhotoArch="${Path_to_dir}/PhotoArch/"
rm ${PhotoIn}*

if [ ! -d "$PhotoIn" ]; then
	mkdir $PhotoIn
	echo "$(date):  Catalog was created" >> "${Path_to_dir}/LogIn.log"

fi
if [ ! -d "$PhotoOut" ]; then
	 mkdir $PhotoOut
	echo "$(date):  Catalog was created" >> "${Path_to_dir}/LogOut.log"
 
fi

if [ ! -d "$PhotoArch" ]; then
	mkdir $PhotoArch
	echo "$(date):  Catalog was created" >> "${Path_to_dir}/LogArch.log"

fi

echo "$(date):	Script The script was running" >> "${Path_to_dir}/LogIn.log"
echo "$(date):  Script The script was running" >> "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script was running" >> "${Path_to_dir}/LogOut.log"

for file in /private/Photo/*; do
	extension="${file##*.}"
	filename="${file%.*}"
	cp "$file" "${PhotoIn}${count}.${extension}" &&  
	echo "Ok:	$file copied in ${PhotoIn}${count}.${extension}" >> "${Path_to_dir}/LogIn.log" ||
	echo "Error:	$file, something went wrong" >> "${Path_to_dir}/LogIn.log" 
	((count++))
done 

for image in $PhotoIn*; do
    if [[ -f "$image" ]]; then
        convert "$image" -quality 30 "${PhotoOut}$(basename ${image%.*}).jpg" && 
        echo "Ok:	$image to ${PhotoOut}$(basename ${image%.*}).jpg" >> "${Path_to_dir}/LogOut.log" ||
	echo "Error:	$image to ${PhotoOut}$(basename ${image%.*}).jpg" >> "${Path_to_dir}/LogOut.log"
    fi
done
chmod -R 755 $Path_to_dir/*
tar -czvf $PhotoArch/$(date +'%Y-%m-%d').tar.gz $PhotoIn && 
echo "Ok: New archiver was created at $(date)" >>  "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogIn.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogOut.log"
