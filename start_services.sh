#!/bin/bash

export NID_CONFIG_DISCOVERY_PORT=8080

docker run -d --name name-container-1 -p 4332:4332 -e PORT=4332 -e COLOR=RED name-image
docker run -d --name name-container-2 -p 4333:4333 -e PORT=4333 -e COLOR=BLUE name-image

docker run -d --name echo-container-1 --add-host name.ndv:$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+') -p 4330:4330 -e PORT=4330 $(./append_envs.sh) echo-image
docker run -d --name echo-container-2 --add-host name.ndv:$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+') -p 4331:4331 -e PORT=4331 $(./append_envs.sh) echo-image

