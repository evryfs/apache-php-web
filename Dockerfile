FROM php:7.4.2-apache
COPY php.ini "$PHP_INI_DIR/php.ini"
COPY apache2.conf /etc/apache2
LABEL maintainer Andreas Thuen <andreas.thuen@evry.com>
RUN apt-get update -y && apt-get install -y \
        nano \
	zlib1g-dev \
        libzip-dev \
        zip \
	curl \
        libcurl4-openssl-dev \
        libpng-dev \
  && docker-php-ext-install gd \
  && docker-php-ext-configure curl \
  && docker-php-ext-install zip \
  && docker-php-ext-install mysqli \
  && apt-get  -y clean \
  && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite && a2enmod headers && a2enmod expires
