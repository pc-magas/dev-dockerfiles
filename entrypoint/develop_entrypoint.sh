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
