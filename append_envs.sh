#!/bin/bash

formatted=""
for line in $(env|grep NID); do
    #echo line: $line

    env=$(echo $line | cut -f1 -d=)
    #echo env: $env

    formatted="$formatted -e $env"
    #echo inside formatted: $formatted
done

echo "$formatted"