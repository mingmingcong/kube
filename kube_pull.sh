while read line; do
	project_name=`echo $line |awk -F":" {'print $1'}`
	project_version=`echo $line |awk -F":" {'print $2'}`
	docker pull gcr.io/google_containers/$project_name:$project_version
done < README 
