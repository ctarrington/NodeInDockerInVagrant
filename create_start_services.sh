#!/bin/bash

SUFFIX=".ndv"

THIS_CLUSTER=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')


services=$@
unique_services=$(tr ' ' '\n' <<< "${services[@]}" | sort -u | tr '\n' ' ')

# generate an add-host parameter for each unique service
hosts=""
for service in $unique_services
do
    hosts="$hosts --add-host $service$SUFFIX:$THIS_CLUSTER"
done

# generate a docker run command for each service
runs=""
port=4330
for service in $services
do
    runs="
$runs
docker run -d --name $service-container-$port $hosts -p $port:$port -e PORT=$port \$(./append_envs.sh) $service-image"

    let "port++"
done

final="
#!/bin/bash

source ./vagrant_configs.env

export NID_CONFIG_DISCOVERY_PORT=8080
$runs
"

echo "${final}"


