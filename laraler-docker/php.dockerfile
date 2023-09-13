FROM php:8-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user ${NGINXUSER}/g" /usr/local/etc/php-fpm.conf
RUN sed -i "s/group = www-data/user ${NGINXGROUP}/g" /usr/local/etc/php-fpm.conf


RUN mkdir -p /var/www/html/public

RUN docker-php-ext-install pdo pdo_mysql

#в cmd можем указать команду которая будет выполнена при старте контейнера \
#здесь указываем что команда php-fpm будет выполнена с аргументами /usr/local/etc/php-fpm.conf
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]