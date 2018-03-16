domain="registry.cn-beijing.aliyuncs.com/mmcloud"
while read line; do
	project_name=`echo $line |awk '{split($0,a,":");print a[1]}'`
	project_version=`echo $line |awk '{split($0,a,":");print a[2]}'`
	docker pull $domain/$project_name:$project_version
	docker tag $domain/$project_name:$project_version k8s.gcr.io/$project_name:$project_version
	docker rmi $domain/$project_name:$project_version
done < README2
