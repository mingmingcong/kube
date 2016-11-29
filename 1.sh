while read project; do

echo $project |awk -F ":" '{print $1}' 

done < project.txt
