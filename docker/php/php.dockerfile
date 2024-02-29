# Используем официальный образ PHP 8.3 с Apache
FROM php:8.3-apache

# Arguments defined in docker-compose.yml
ARG user
ARG uid

#RUN apt-get update \
#    && apt-get install -y \
#        libzip-dev \
#        zip\
#        bison \
#        autoconf \
#        libltdl-dev \
#        libbz2-dev \
#        libxml2-dev \
#        libxslt1-dev \
#        libpspell-dev \
#        libmcrypt-dev \
#        libpng-dev \
#        libfreetype6-dev \
#        libcurl4-openssl-dev;



# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Установка и активация расширения Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user


# Копируем конфигурацию Xdebug
COPY /docker/php/config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN a2enmod rewrite
RUN service apache2 restart




# Set working directory
WORKDIR /var/www/project

USER $user


#RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m -d /app -s /sbin/nologin -c "App user" app && \
#    chmod 777 /var/www

#RUN chmod 777 -R /var/www/project