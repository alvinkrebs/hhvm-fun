FROM hhvm/hhvm-proxygen:latest
RUN rm -rf /var/www
ADD . /var/www
RUN useradd -ms /bin/bash www
WORKDIR /var/www
RUN chown -R www /var/www
USER www
ADD hh_autoload.json /var/www
RUN curl https://raw.githubusercontent.com/hhvm/hhast/master/.hhconfig > .hhconfig
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN php composer.phar require hhvm/hsl hhvm/hhvm-autoload
RUN php composer.phar -v require facebook/xhp-lib ^4.0
RUN php composer.phar require --dev hhvm/hhast hhvm/hacktest facebook/fbexpect

EXPOSE 80

## to see what whas installed
##      docker build . -t test
##      docker run -it --rm test sh
