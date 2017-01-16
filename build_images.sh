pwd=`pwd`
docker rmi `docker images | awk '{print $3}' | grep -v "IMAGE"`
while read line; do
	#echo $line
	project_name=`echo $line |awk '{split($0,a,":");print a[1]}'`
	project_version=`echo $line |awk '{split($0,a,":");print a[2]}'`
	cd $pwd
	if [ -d "$project_name" ]
	then
		cd $pwd/$project_name && docker build .
	else
		echo "$project_name not Found"
	fi
done < README 
