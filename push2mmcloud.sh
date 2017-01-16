
pwd=`pwd`
while read line; do
        project_name=`echo $line |awk '{split($0,a,":");print a[1]}'`
        project_version=`echo $line |awk '{split($0,a,":");print a[2]}'`
	ImageId=`docker images | grep ${project_name} | awk '{print $2}'`
	echo $ImageId
#	docker tag $ImageId registry.cn-beijing.aliyuncs.com/mmcloud/kubes:$project_version
done < README
#docker push registry.cn-beijing.aliyuncs.com/mmcloud/kubes:$project_version
