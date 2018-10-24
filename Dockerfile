FROM php:7.2-apache
COPY ./ /var/www/html
MAINTAINER Andreas Thuen <andreas.thuen@evry.com>
RUN apt-get update && apt-get install -y \
        nano \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip \
  && docker-php-ext-install mysqli
RUN a2enmod rewrite && a2enmod headers
