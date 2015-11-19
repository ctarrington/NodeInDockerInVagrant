#!/bin/bash

./stop_nginx.sh
./stop_services.sh

./remove_images.sh
./build_images.sh

./create_start_services.sh echo 1 name 2 > generated_start_services.sh && chmod +x generated_start_services.sh && chown vagrant generated_start_services.sh
./create_nginx_config.sh echo 1 name 2 > generated_nginx.conf && chown vagrant generated_nginx.conf

./generated_start_services.sh
./start_nginx.sh