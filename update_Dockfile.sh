while read line; do
	#echo $line
	project_name=`echo $line |awk '{split($0,a,":");print a[1]}'`
	project_version=`echo $line |awk '{split($0,a,":");print a[2]}'`
	if [ ! -d "$project_name" ]
	then
		mkdir $project_name 
	fi
	echo "FROM gcr.io/google_containers/kube-apiserver-amd64:$project_version
MAINTAINER mingmingcong mingming@dong-design.com"> "$project_name/Dockerfile"
done < README 
