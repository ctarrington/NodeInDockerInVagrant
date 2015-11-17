#!/bin/bash

./stop_nginx.sh
./stop_services.sh

./remove_images.sh
./build_images.sh

./start_services.sh
./start_nginx.sh