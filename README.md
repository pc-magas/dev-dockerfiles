# Usefull PHP Docker Images for implementing web apps

# Available images:

* `etable/php:base`: containing the required dependencies for any development or production image.
* `etable/php:dev-n-build`: containing usefull development tools and required tools to build the application.
* `etable/^app^:prod-vX.X.X`: Production-ready image of version `vX.X.X`.
* `etable/^app^:prod-latest`: Production-ready image of the latest version.

# Per Image Documentation

## `etable/php:base`
Foundations with common php configuration and setup. It uses `memcache` session type and in order to use it is recommended to use `docer-compose` and the following settings:

```
# Some other docker-compose.yml configurations
  my_image:
    from: ^your_image_built_upon_etable/php:base^
    links:
        - memcache

  memcache:
    image: memcached:alpine

```

In case that for some reason you need to rename your `memcache` service (for example `my_memcache`) differently then use the following approach into `docker-compose.yml`:

```
# Some other docker-compose.yml configurations
  my_image:
    from: ^your_image_built_upon_etable/php:base^
    links:
        - my_memcache:memcache

  my_memcache:
    image: memcached:alpine
```

### Enviromental Variables are used:

Name | Default Value | Description
--- | --- | ---
PHP_CONF_DIR | "$PHP_INI_DIR/conf.d"  | The directory where php stored its configuration.*
PHP_SETTINGS | "$PHP_INI_DIR/php.ini" | Location of the `php.ini` file.*
FPM_CONF_DIR | "/usr/local/etc/php-fpm.d" | The directory where the php-fpm has its configuration.
SESSION_STORAGE_TYPE | "memcache" | Type to store the session
SESSION_STORAGE_PATH | "tcp:\/\/memcache:11211" | Where session is being stored

\* The `PHP_INI_DIR` Enviromental variable is inherited from the base php image.

## `etable/php:dev-n-build`
This image inherits the `etable/php:base` where in order to connect into the memcache you should consult the documentation regarding `etable/php:base`.

Listening PORT: 9000
Php Files VOLUME: `/var/www/html`

### Build Arguments

* `USERID` : Indicating the initial user is of the user `www-data`
* `GROUPID` : Indication the initial group is of the user `www-data`

### Enviromental Variables:

Name | Default Value | Description
--- | --- | ---
DOCKER_UID `USERID` build argument | The user id in order to map the user.
DOCKER_GID `GROUPID` build argument | The group id in order to map the user.
XDEBUG_CONF_FILE | ${PHP_CONF_DIR}/docker-php-ext-xdebug.ini | Where the xdebug configuration is located.
XDEBUG_HOST | N/A | The host where xdebug uses for connection.
XDEBUG_IDE_KEY | N/A | The IDE key where is USED in order to indicates the ide.
XDEBUG_PORT | 9000 | Default port that xdebug uses for connection.
XDEBUG_DBGP | FALSE | Whether or not to use XDEBUG `dbgp` protocol.

# Docker compose documentation

The `docker-compose.yml` requires the parameter `CODE_BASE_PATH` indicating where the code where your app is stored and developed.
In order to provide the required parameter make a `.env` file and place the following settings:

```env
CODE_BASE_PATH=^some_path^
```

Keep in mind that you should **NOT** use any kind of quotes to the value.
