#!/bin/bash
mkdir /var/www/html/VideoOut
mkdir /var/www/html/VideoIn
mkdir /var/www/html/VideoArh
mkdir /var/www/html/VideoOut/temp

input_file="*.webm"
cur_dir="/var/www/html"
VideoOut="$cur_dir/VideoOut"
VideoIn="$cur_dir/VideoIn"
VideoArch="$cur_dir/VideoArch"
VideoTemp="$VideoOut/temp"

segment_duration="600"


output_pattern="part%d.webm"

for file in "${VideoIn}"/*
do

	filename=$(basename "$file")
	filename=${filename%.*}
	
	ffmpeg -i $file -threads 8 -c:v libvpx-vp9 -c:a libopus  "$VideoTemp/$filename.webm"
	echo "Ok:Video: $file to ${VideoOut}/$filename.webm" >> "${cur_dir}/LogOut.log"
done
segment_number=0
for file in "$VideoTemp"/*
do
	filename=$(basename "$file")
	filename=${filename%.*}


	ffmpeg -i "$file" -c copy -map 0 -reset_timestamps 1 -segment_time $segment_duration -f segment "$VideoOut"/"$filename""$output_pattern"
	echo "Ok:Video: $file divided into 2 parts" >> "${cur_dir}/LogOut.log"

done

chmod -R 755 /var/www/html/*
tar -czvf $VideoArch/$(date +'%Y-%m-%d').tar.gz $VideoIn && 
echo "Ok: New video archiver was created at $(date)" >>  "${cur_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${cur_dir}/LogIn.log"
echo "$(date):  Script The script stopped" >> "${cur_dir}/LogArch.log"
echo "$(date):  Script The script stopped" >> "${cur_dir}/LogOut.log"
