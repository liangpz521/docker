FROM ubuntu
MAINTAINER Michael Crosby <michael@crosbymichael.com>
ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common && apt-get update && \
apt-get install -y \
gcc \
build-essential \
libssl-dev \
make \
libcurl4-gnutls-dev \
libjpeg-dev \
libpng-dev \
libmcrypt-dev \
libreadline6-dev \
libfreetype6-dev \
libxml2-dev \
librabbitmq-dev \
autoconf \
wget && rm -rf /var/lib/apt/lists/*

		

# 2 --- 创建mynewuser用户，让这个用户有root权限
RUN useradd --create-home --no-log-init --shell /bin/bash www && adduser www sudo && echo 'www:mynewpassword' | chpasswd
WORKDIR /home/www
RUN mkdir source

# 将预先下载好的拓展包从宿主机拷贝进去
COPY ./pkg/php-7.1.22.tar.gz /home/www/source/php-7.1.22.tar.gz
COPY ./pkg/swoole-v4.3.1.tar.gz /home/www/source/swoole.tar.gz
WORKDIR /home/www/source
#下载并安装php
RUN tar -zxvf /home/www/source/php-7.1.22.tar.gz && \
cd /home/www/source/php-7.1.22 && ./configure \
--prefix=/home/www/webserver/php \
--with-config-file-path=/home/www/webserver/php/etc \
--enable-fpm \
--with-fpm-user=www \
--with-fpm-group=www \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-iconv-dir \
--with-freetype-dir=/usr/lib \
--with-jpeg-dir \
--with-png-dir \
--with-zlib \
--with-libxml-dir=/usr \
--enable-xml \
--disable-rpath \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--with-curl \
--enable-mbregex \
--enable-mbstring \
--with-mcrypt \
--enable-ftp \
--with-gd \
--enable-gd-native-ttf \
--with-mhash \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-zip \
--enable-soap \
--without-pear \
--with-gettext \
--disable-fileinfo \
--enable-maintainer-zts \
--enable-mysqlnd && make && make install && \
cp /home/www/source/php-7.1.22/sapi/fpm/init.d.php-fpm  /etc/init.d/php-fpm && \
cp /home/www/source/php-7.1.22/php.ini-production /home/www/webserver/php/etc/php.ini && \
cp /home/www/webserver/php/etc/php-fpm.conf.default  /home/www/webserver/php/etc/php-fpm.conf && \
cp /home/www/webserver/php/etc/php-fpm.d/www.conf.default /home/www/webserver/php/etc/php-fpm.d/www.conf && \
rm -rf /home/www/source

# 6 - Other
EXPOSE 80

RUN apt-get autoremove -y make wget build-essential autoconf gcc && apt-get clean 
#RUN rm -rf /home/www/webserver/php/bin/phpdbg && rm -rf /home/www/webserver/php/bin/php-cgi
CMD ["/home/www/webserver/php/php/sbin/php-fpm"]
