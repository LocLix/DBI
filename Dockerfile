FROM php:7.4-apache

RUN apt-get update
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


ENV EXEC_ROOT="/root/"

WORKDIR ${EXEC_ROOT}

COPY . .

#EXPOSE 5080
CMD "${EXEC_ROOT}/assets/scripts/start.sh"

