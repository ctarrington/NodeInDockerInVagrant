#!/bin/bash

# create a script to run docker containers
# EX: create_start_services.sh echo 1 name 2
# creates a start script that runs one echo service and to two name services

SUFFIX=".ndv.here"

THIS_CLUSTER=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')

# build a map with the service name as the key and the number of instances as the value
declare -A service_to_count_map
while (( "$#" )); do
    key=$1;shift
    value=$1;shift
    service_to_count_map[$key]=$value
done

# generate an add-host parameter for each service
hosts=""
for service in "${!service_to_count_map[@]}"
do
    hosts="$hosts --add-host $service$SUFFIX:$THIS_CLUSTER"
done

# generate a docker run command for each service instance
runs=""
port=4330
for service in "${!service_to_count_map[@]}"
do
    number_of_instances=${service_to_count_map[$service]}
    for (( ctr=1; ctr<=$number_of_instances; ctr++ ))
        do
            runs="
$runs
docker run -d --name $service-container-$port $hosts -p $port:$port -e PORT=$port \$(./append_envs.sh) $service-image"
            let "port++"
    done
done

final="
#!/bin/bash

source ./vagrant_configs.env

export NID_CONFIG_DISCOVERY_PORT=8080
$runs
"

echo "${final}"


