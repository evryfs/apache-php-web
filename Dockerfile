FROM php:7.4.0-apache
COPY php.ini /usr/local/etc/php
COPY apache2.conf /etc/apache2
LABEL maintainer Andreas Thuen <andreas.thuen@evry.com>
RUN apt-get update -y && apt-get install -y \
        nano \
        libzip-dev \
        zip \
        libcurl4-openssl-dev \
        libpng-dev \
  && docker-php-ext-install gd \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-configure curl \
  && docker-php-ext-install zip \
  && docker-php-ext-install mysqli \
  && apt-get  -y clean \
  && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite && a2enmod headers && a2enmod expires
