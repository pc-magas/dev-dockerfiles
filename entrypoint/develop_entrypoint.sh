#/bin/sh

USER_ID=$(id -u developer)
GROUP_ID=$(id -g developer)

echo "Setting the correct user and group id for shell use"
if [ ${DOCKER_UID} != ${USER_ID} ]; then
  usermod -u ${DOCKER_UID} developer
fi

if [ ${DOCKER_GID} != ${GROUP_ID} ]; then
  groupmod -g ${DOCKER_GID} developer
fi

echo "Setup xdebug"
cp ${XDEBUG_CONF_FILE}.orig ${XDEBUG_CONF_FILE}

if [ -z ${XDEBUG_HOST} ]; then
    ip=$(netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10)
    XDEBUG_HOST=${ip}
fi

echo "xdebug.remote_host=${XDEBUG_HOST}" >> ${XDEBUG_CONF_FILE}
echo "xdebug.repomote_port=${XDEBUG_PORT}" >> ${XDEBUG_CONF_FILE}

if [ XDEBUG_DBGP = TRUE ]; then
    echo "xdebug.remote.handler=dbgp" >> ${XDEBUG_CONF_FILE}
fi

if [ ! -z "${XDEBUG_IDE_KEY}" ]; then
    echo "xdebug.idekey=\"${XDEBUG_IDE_KEY}\"" >> ${XDEBUG_CONF_FILE}
fi

echo "Launch application"
exec $@