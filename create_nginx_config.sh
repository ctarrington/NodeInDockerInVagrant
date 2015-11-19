#!/bin/bash

# generate a nginx config based on the passed services
# creates a server block for each service and maps to the specified number of upstream service providers
#
# EX: create_nginx_config.sh echo 1 name 2
# resulting config maps to one upstream echo service and to two upstream name services


THIS_CLUSTER=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
OUTSIDE_HOST=$(netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10)

# build a map with the service name as the key and the number of instances as the value
declare -A service_to_count_map
while (( "$#" )); do
    key=$1;shift
    value=$1;shift
    service_to_count_map[$key]=$value
done

# generate an upstream block for each services with a line per instance
upstream_blocks=""
port=4330
for service in "${!service_to_count_map[@]}"
do
    block="
upstream $service-service {
    #server $OUTSIDE_HOST:$port;"
    number_of_instances=${service_to_count_map[$service]}
    for (( ctr=1; ctr<=$number_of_instances; ctr++ ))
        do
            block="
    $block
    server $THIS_CLUSTER:$port;"
            let "port++"
    done

    block="
    $block
    }"

    upstream_blocks="$upstream_blocks $block"
done


# generate a service block for each unique service
server_blocks=""
for service in "${!service_to_count_map[@]}"
do
    server_blocks="
$server_blocks
  server {
    listen 8080;
    server_name $service.ndv.*;

    location / {
      proxy_pass http://$service-service;
    }

  }
  "
done



final="
worker_processes  5;
worker_rlimit_nofile 8192;

events {
  worker_connections  1024;
}

http {
$upstream_blocks

$server_blocks
}
"

echo "${final}"
