#!
set -x
source ./project.properties
docker rm -f $container_name 2>/dev/null
[ -d ./tmp ] && rm -rf ./tmp