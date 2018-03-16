while read line; do
	project_name=`echo $line |awk -F":" {'print $1'}`
	project_version=`echo $line |awk -F":" {'print $2'}`
	if [ ! -d "${project_name}" ]
	then
		mkdir ${project_name}
	fi
	echo "FROM gcr.io/google_containers/${project_name}:${project_version}
MAINTAINER cmm cmm@mmcloud.io"> "${project_name}/Dockerfile"
done < README 
