# Используем официальный образ Apache
FROM httpd:latest
WORKDIR /var/www/project

# Копируем файл конфигурации виртуального хоста
COPY /docker/apache/config/httpd-vhosts.conf /usr/local/apache2/conf/extra/my-vhost.conf

# Включаем файл конфигурации виртуального хоста в основной файл конфигурации Apache
RUN echo "Include conf/extra/my-vhost.conf" >> /usr/local/apache2/conf/httpd.conf

# Добавление строки LoadModule mpm_prefork_module modules/mod_mpm_prefork.so в httpd.conf
#RUN echo 'LoadModule mpm_prefork_module modules/mod_mpm_prefork.so' >> /usr/local/apache2/conf/httpd.conf


# Настройка логирования
RUN chmod -R 755 /usr/local/apache2/logs \
    && ln -sf /dev/stdout /usr/local/apache2/logs/access_log \
    && ln -sf /dev/stderr /usr/local/apache2/logs/error_log


RUN chmod -R 777 /var/www/project
#COPY /docker/apache/config/httpd-vhosts.conf /usr/local/apache2/conf/extra/laravel.conf

# Установка модуля MPM и его загрузка
#RUN sed -i 's/#LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/' /usr/local/apache2/conf/httpd.conf
