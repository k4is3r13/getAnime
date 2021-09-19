#!/bin/bash
#Creator: kxisxr
greenColour="\x1B[0;32m\033[1m"
endColour="\033[0m\x1B[0m"
redColour="\x1B[0;31m\033[1m"
blueColour="\x1B[0;34m\033[1m"
yellowColour="\x1B[0;33m\033[1m"
purpleColour="\x1B[0;35m\033[1m"
turquoiseColour="\x1B[0;36m\033[1m"
grayColour="\x1B[0;37m\033[1m"

#echo -e "${blueColour}"'------------------------------------------------------------------'"${endColour}"
echo -e "${greenColour}""
                                  _                 
                _      /\        (_)                
 ___ ____  ____| |_   /  \  ____  _ ____   ____ ___ 
(___) _  |/ _  )  _) / /\ \|  _ \| |    \ / _  |___)
   ( ( | ( (/ /| |__| |__| | | | | | | | ( (/ /     
    \_|| |\____)\___)______|_| |_|_|_|_|_|\____)    
   (_____|                                          

by kxisxr
@pixelbit131
""${endColour}"

echo -e "${blueColour}"'------------------------------------------------------------------'"${endColour}"
echo -e ' '


echo -e -n "${yellowColour}"'Anime: '"${endColour}"
read anime

echo -e -n "${greenColour}"'Link: '"${endColour}"
read link

mkdir $anime
cd $anime

echo -e -n "${purpleColour}"'Getting links...'"${endColour}"
echo -e ' '
clear

curl -s -g "$link" | tr ">" "\n" | grep -E ".mkv|.mp4" | grep -vEi "ouo|Ending|Opening" | sed 's/ /%20/g' > $anime.txt
#check=$(curl -s -g "$link" | tr ">" "\n" | grep -E ".mkv|.mp4" | grep -vEi "ouo|Ending|Opening" | sed 's/ /%20/g')

echo -e -n "${purpleColour}"'Downloading videos...'"${endColour}"
echo -e ' ' 

i=0
for video in $(cat $anime.txt)
do
((i=i+1))
ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -headers 'User-Agent: Mozilla' -i $video -map 0 -c copy -c:a aac $anime"_"$i.mkv

done

clear
echo -e -n "${purpleColour}"'Done!...: '"${endColour}"

exit 1
