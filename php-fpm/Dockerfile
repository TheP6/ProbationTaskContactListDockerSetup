FROM php:7.4-fpm

ENV DEBIAN_FRONTEND noninteractive
RUN TERM=xterm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        libjpeg-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libpng-dev \
        libpq-dev \
        libssl-dev \
        libz-dev \
        libzip-dev \
        ssh \
        supervisor \
        unzip \
        nano \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

RUN docker-php-ext-install \
    bcmath \
    exif \
    opcache \
    pdo_mysql \
    sockets \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY php.ini /usr/local/etc/php/conf.d/
COPY www.conf /usr/local/etc/php-fpm.d/

WORKDIR /var/www

RUN chown -R www-data:www-data /var/www

COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /usr/local/bin/

RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat

RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT  ["sh","/usr/local/bin/entrypoint.sh"]