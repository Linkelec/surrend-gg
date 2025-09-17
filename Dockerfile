FROM php:8.4-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev \
    && docker-php-ext-install pdo_pgsql opcache \
    && pecl install apcu xdebug \
    && docker-php-ext-enable apcu xdebug \
    && rm -rf /var/lib/apt/lists/* /tmp/pear
     
COPY php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html
