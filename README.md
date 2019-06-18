# Usefull PHP Docker Images for implementing web apps

# Available images:

* `etable/php:base`: containing the required dependencies for any development or production image.
* `etable/php:dev-n-build`: containing usefull development tools and required tools to build the application.
* `etable/^app^:prod-vX.X.X`: Production-ready image of version `vX.X.X`.
* `etable/^app^:prod-latest`: Production-ready image of the latest version.

# Per Image Documentation

## `etable/php:base`
In order to 

## `etable/php:dev-n-build`

Listening PORT: 9000
Php Files VOLUME: `/var/www/html`

Enviromental Variables:

Name | Default Value | Description
--- | --- | ---
DOCKER_UID `USERID` build argument | The user id in order to map the user.
DOCKER_GID `GROUPID` build argument | The group id in order to map the user.
PHP_CONF_DIR | "/usr/local/etc/php/conf.d"  | The directory where php stored its cvonfiguration.
FPM_CONF_DIR | "/usr/local/etc/php-fpm.d" | The directory where the php-fpm has its configuration.
XDEBUG_CONF_FILE | ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini | Where the xdebug configuration is located.
XDEBUG_HOST | N/A | The host where xdebug uses for connection.
XDEBUG_IDE_KEY | N/A | The IDE key where is USED in order to indicates the ide.
XDEBUG_PORT | 9000 | Default port that xdebug uses for connection. 
XDEBUG_DBGP | FALSE | Whether or not to use XDEBUG `dbgp` protocol.