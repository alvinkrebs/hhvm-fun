FROM hhvm/hhvm-proxygen:latest
RUN rm -rf /var/www
RUN git clone https://github.com/alvinkrebs/hhvm-fun.git
RUN mv hhvm-fun /var/www
WORKDIR /var/www
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN php composer.phar require hhvm/hsl hhvm/hhvm-autoload
RUN php composer.phar -v require facebook/xhp-lib ^4.0
RUN php composer.phar require --dev hhvm/hhast hhvm/hacktest facebook/fbexpect
EXPOSE 80
##
## to see what was installed
##      docker build . -t test
##      docker run -it --rm test sh
##
## to run
##      docker build .
##      --> bunch of messages, look for writing image sha256:c7b62a659fd5888d1ffb119db27a79149a9c1e74791def0098a7c9fcd0e8bcdc
##      docker run -p 0.0.0.0:80:80 c7b62a659fd5888d1ffb119db27a79149a9c1e74791def0098a7c9fcd0e8bcdc
## or just name/tag image
##      docker build . -t stand-up && docker run -p 0.0.0.0:80:80 stand-up
##
##
## Served out of /var/www/public, so, static css, images, js should live in /var/www/public and /var/public/images/
##

