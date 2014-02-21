# Composable Stack Member for docker base
FROM        ubuntu:saucy
MAINTAINER  Ross Riley "riley.ross@gmail.com"

# Install PHP5 and modules
RUN apt-get -y install php5-fpm php5-mysql php-apc php5-mcrypt php5-curl php5-gd php5-json php5-cli
RUN sed -i -e "s/short_open_tag = Off/short_open_tag = On/g" /etc/php5/fpm/php.ini
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Configure nginx for PHP websites
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN echo "max_input_vars = 10000;" >> /etc/php5/fpm/php.ini
RUN echo "date.timezone = Europe/London;" >> etc/php5/fpm/php.ini
