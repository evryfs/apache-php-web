FROM php:7.2-apache
label maintainer Andreas Thuen <andreas.thuen@evry.com>
RUN apt-get update && apt-get install -y \
        nano \
        libzip-dev \
        zip \
        libcurl4-openssl-dev \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-configure curl \
  && docker-php-ext-install zip \
  && docker-php-ext-install mysqli	
RUN a2enmod rewrite && a2enmod headers && a2enmod expires
