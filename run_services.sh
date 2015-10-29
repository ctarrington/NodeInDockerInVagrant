#!/bin/bash

source ./vagrant_configs.env

docker run -d --name name-container -p $NID_CONFIG_NAME_SVC_PORT:$NID_CONFIG_NAME_SVC_PORT $(./append_envs.sh) name-image
docker run -d --name echo-container -p $NID_CONFIG_ECHO_SVC_PORT:$NID_CONFIG_ECHO_SVC_PORT $(./append_envs.sh) echo-image
