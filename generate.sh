 #!/bin/bash

while true
do
    random_port=$(( ((RANDOM<<15)|RANDOM) % 49152 + 10000 ))
    status="$(nc -z 127.0.0.1 $random_port < /dev/null &>/dev/null; echo $?)"
    if [ "${status}" != "0" ]; then
        echo "$random_port is free to use";
        exit;
    fi
done