#!/bin/bash

formatted=""
for line in $(env|grep NID); do

    env=$(echo $line | cut -f1 -d=)
    formatted="$formatted -e $env"

done

echo "$formatted"