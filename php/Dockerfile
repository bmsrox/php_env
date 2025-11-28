FROM php:8.4.10-apache

RUN apt update && \ 
    apt install -y libzip-dev curl git openssl libssl-dev && \
    a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql zip && \
    yes | pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-configure zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer

COPY ./99-xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini

RUN cd /tmp && git clone https://github.com/swoole/swoole-src.git && \
    cd swoole-src && \
    phpize  && \
    ./configure  --enable-openssl && \
    make && make install

RUN touch /usr/local/etc/php/conf.d/swoole.ini && \
    echo 'extension=swoole.so' > /usr/local/etc/php/conf.d/swoole.ini


