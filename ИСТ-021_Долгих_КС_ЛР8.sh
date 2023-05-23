#!/bin/bash

count=1
Path_to_dir="/var/www/html"
LrIn="${Path_to_dir}/LrIn/"
LrDOC="${Path_to_dir}/LrDOC/"
LrPDF="${Path_to_dir}/LrPDF/"
LrArch="${Path_to_dir}/LrArch/"
rm ${LrIn}*

if [ ! -d "$LrIn" ]; then
	mkdir $LrIn
	echo "$(date):DOC:	 Catalog LrIn was created" >> "${Path_to_dir}/LogIn.log"

fi
if [ ! -d "$LrDOC" ]; then
	 mkdir $LrDOC
	echo "$(date):DOC:  	 Catalog LrDOC was created" >> "${Path_to_dir}/LogOut.log"
 
fi

if [ ! -d "$LrPDF" ]; then
	mkdir  $LrPDF
	echo "$(date):DOC:	 Catalog LrPDF was created" >> "${Path_to_dir}/LogOut.log"
 
fi
if [ ! -d "$LrArch" ]; then
	mkdir $LrArch
	echo "$(date):DOC:  	Catalog LrArch  was created" >> "${Path_to_dir}/LogArch.log"

fi

echo "$(date):	Script The script was running" >> "${Path_to_dir}/LogIn.log"
echo "$(date):  Script The script was running" >> "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script was running" >> "${Path_to_dir}/LogOut.log"

for file in /private/LrDOC/*; do
	
	cp "$file" "$LrDOC" &&  
	echo "Ok:DOC:		$file copied in ${LrDOC}" >> "${Path_to_dir}/LogIn.log" ||
	echo "Error:DOC:	$file, something went wrong" >> "${Path_to_dir}/LogIn.log"
done 


for file in $LrDOC*; do

#        soffice --headless --convert-to pdf $file --outdir $LrPDF 
		lowriter --nologo --convert-to pdf $file --outdir $LrPDF &&
#		doc2pdf  --output=$LrPDF "$file"  && 
        echo "Ok:	$file to ${LrOut}$(basename ${file%.*}).pdf" >> "${Path_to_dir}/LogOut.log" ||
	echo "Error:	$file to ${LrOut}$(basename ${file%.*}).pdf" >> "${Path_to_dir}/LogOut.log"
done
chmod -R 755 $Path_to_dir/*
tar -czvf $LrArch/$(date +'%Y-%m-%d').tar.gz $LrIn && 
echo "Ok: New archiver was created at $(date)" >>  "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogIn.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${Path_to_dir}/LogOut.log"
