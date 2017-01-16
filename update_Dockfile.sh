while read line; do
	#echo $line
	project_name=`echo $line |awk '{split($0,a,":");print a[1]}'`
	project_version=`echo $line |awk '{split($0,a,":");print a[2]}'`
	if [ -d "$project_name" ]
	then
		echo "FROM gcr.io/google_containers/$project_name:$project_version
MAINTAINER cmm cmm@mmcloud.io"> "$project_name/Dockerfile"
	else
		echo "$protject_name not found"
	fi
done < README 
