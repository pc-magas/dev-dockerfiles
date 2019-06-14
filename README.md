# Usefull PHP Docker Images for implementing web apps

# Available images:

* `etable/php:base`: containing the required dependencies for any development or production image.
* `etable/php:dev-n-build`: containing usefull development tools and required tools to build the application.
* `etable/^app^:prod-vX.X.X`: Production-ready image of version `vX.X.X`.
* `etable/^app^:prod-latest`: Production-ready image of the latest version.

# Per Image Documentation

## `etable/php:dev-n-build`
This image exposes the path `/home/developer/code` where each user can place it own code there. Also it utilizes the default sockets and volumes from `php:7.2-fpm-alpine` as well therefore it uses any volumes and ports from it.

Also 