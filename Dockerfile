FROM php:8.1.5-apache
COPY php.ini "$PHP_INI_DIR/php.ini"
COPY apache2.conf /etc/apache2
COPY openssl.cnf /etc/ssl/openssl.cnf
LABEL maintainer Mats Gundersen <mats.gundersen@tietoevry.com>
RUN apt-get update -y && apt-get install -y \
        nano \
	zlib1g-dev \
        libzip-dev \
        zip \
	curl \
        libcurl4-openssl-dev \
        libpng-dev \
	task-spooler \
        mariadb-client \
        iputils-ping \
        openssh-client \
        vim \
        telnet \
        cron \
        ntp \
	dos2unix \
  && docker-php-ext-install gd \
  && docker-php-ext-configure curl \
  && docker-php-ext-install zip \
  && docker-php-ext-install mysqli \
  && apt-get  -y clean \
  && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite && a2enmod headers && a2enmod expires
