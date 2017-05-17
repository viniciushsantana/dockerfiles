FROM php:fpm
RUN apt-get update && apt-get install -y libcurl4-gnutls-dev \
	libbz2-dev \
	zlib1g-dev \
	libmemcached-dev \
	&& docker-php-ext-install json \
	&& docker-php-ext-install curl \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install bz2 \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/xdebug.ini

CMD ["php-fpm"]
