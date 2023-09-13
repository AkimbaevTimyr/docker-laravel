FROM nginx:stable-alpine3.17-slim

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

# -p флаг создаем промежуточные директории если их нету на пути 
# создаем папку html в var/www или же создаем папки /var/www/html если таких нету
RUN mkdir -p /var/www/html/public

# копируем настройки из nginx/default.conf в /etc/nginx/conf.d/default.conf
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# меняем название пользователя с www-data на laravelx
RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}
