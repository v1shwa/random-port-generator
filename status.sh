 #!/bin/bash

if [[ $# -eq 0 ]]
then
    echo "Missing a required argument: port"
else
    port_pid=$(lsof -t -i :$1)
    if [ -z "$port_pid" ]
    then
        echo "$1 is free to use"
    else
        echo "Port $1 is in use by "$(ps -p $port_pid -o comm=)
    fi
fi