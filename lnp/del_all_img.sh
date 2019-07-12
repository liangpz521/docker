

#删除所有
docker rmi `docker images -q`

#没有打标签
docker rmi `docker images -q | awk '/^<none>/ { print $3 }'`
