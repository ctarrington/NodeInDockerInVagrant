#!/bin/bash

# for each matching environment variable add a parameter for docker run as in -e NID_FOO -e NID_BAR
# this causes NID_FOO and NID_BAR to be copied from the host env to the containers env

formatted=""
for line in $(env|grep NID); do

    env=$(echo $line | cut -f1 -d=)
    formatted="$formatted -e $env"

done

echo "$formatted"