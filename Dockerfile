FROM php:7.4-apache

#RUN apt-get update
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


ENV EXEC_ROOT="/root"
ENV PHP_MODE="development"

RUN mv /usr/local/etc/php/php.ini-${PHP_MODE} /usr/local/etc/php/php.ini
RUN apt-get update
RUN apt-get install git zip unzip wget libzip-dev zlib1g-dev libcurl4-openssl-dev libonig-dev libpng-dev -yqq


WORKDIR ${EXEC_ROOT}

RUN mkdir assets

WORKDIR ${EXEC_ROOT}/assets
COPY assets .

RUN apt-get clean
#EXPOSE 5080
ENTRYPOINT "${EXEC_ROOT}/assets/scripts/start.sh"

