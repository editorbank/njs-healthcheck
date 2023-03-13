#!
set -x
source ./project.properties

docker rm -f $container_name
docker run -d --name $container_name \
  -v ./src/nginx.conf:/etc/nginx/nginx.conf \
  -v ./src/http.js:/etc/nginx/http.js \
  -p 8000:8000 \
  $image_name

sleep 2s
container_port=8000
[ ! -z $container_port ] &&\
  curl -D- localhost:$container_port/healthcheck
