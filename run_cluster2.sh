#!/bin/bash

export NID_CONFIG_ECHO_SVC_HOST=192.168.60.12
export NID_CONFIG_ECHO_SVC_PORT=4331
export NID_CONFIG_NAME_SVC_HOST=192.168.60.12
export NID_CONFIG_NAME_SVC_PORT=4332

docker run -d --name name-container -p $NID_CONFIG_NAME_SVC_PORT:$NID_CONFIG_NAME_SVC_PORT $(./append_envs.sh) name-image
docker run -d --name echo-container -p $NID_CONFIG_ECHO_SVC_PORT:$NID_CONFIG_ECHO_SVC_PORT $(./append_envs.sh) echo-image
