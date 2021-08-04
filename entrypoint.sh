#!/bin/sh
/entrypoint &
if [ -f ${PUBLICIP_FILE} ] && [ -f ${PORT_FORWARDING_STATUS_FILE} ]; then
    export ADDRESS=$(cat ${PUBLICIP_FILE}):$(cat ${PORT_FORWARDING_STATUS_FILE})
    /app/entrypoint --server.address=0.0.0.0:$(cat ${PORT_FORWARDING_STATUS_FILE}) "$@"
elif [[ -z "`jobs`" ]]; then
    echo "gluetun died" 1>&2
    exit 1
else
    sleep 10
fi
