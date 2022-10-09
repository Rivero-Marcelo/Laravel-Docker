FROM php:8.1.11-fpm-alpine3.16

RUN docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-install pdo pdo_mysql


COPY --from=composer/composer /usr/bin/composer /usr/bin/composer

WORKDIR /app

CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]



