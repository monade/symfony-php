FROM php:7.3-fpm
RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick
RUN apt-get install -yqq libicu-dev libpq-dev libzip-dev zlib1g-dev wget gnupg

RUN docker-php-ext-install zip pdo pdo_mysql mysqli gd pdo_pgsql pgsql sockets intl
RUN pecl install apcu && docker-php-ext-enable apcu

