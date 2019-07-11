FROM ubuntu
MAINTAINER Michael Crosby <michael@crosbymichael.com>
#RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ cosmic main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --no-install-recommends  software-properties-common ca-certificates tzdata
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#安装php7-fpm
RUN apt-get install -y wget \
	curl \
	php7.2-cli \
	php7.2-common \
	php7.2-dev \
	php7.2-fpm \
	php7.2-mysql \
	php7.2-curl \
	php7.2-gd \
	php7.2-intl \
	php-imagick \
	php7.2-imap \
	php7.2-xmlrpc \
	php7.2-xsl

#
RUN apt-get install -y nginx

# 对其他容器开放9000端口
EXPOSE 9000 9501 80
WORKDIR /home
#RUN wget http://pecl.php.net/get/redis-5.0.0.tgz
#RUN tar -zxvf redis-5.0.0.tgz
#RUN cd redis-5.0.0 && /usr/bin/phpize7.2 && ./configure && make && make install
#RUN echo "extension=redis.so" >> /etc/php/7.2/mods-available/redis.ini
#RUN ln -s /etc/php/7.2/mods-available/redis.ini /etc/php/7.2/fpm/conf.d/redis.ini
#RUN ln -s /etc/php/7.2/mods-available/redis.ini /etc/php/7.2/cli/conf.d/redis.ini

#RUN wget http://pecl.php.net/get/swoole-4.4.0.tgz
#RUN tar -zxvf swoole-4.4.0.tgz
#RUN cd swoole-4.4.0 && /usr/bin/phpize7.2 && ./configure && make && make install
#RUN echo "extension=swoole.so" >> /etc/php/7.2/mods-available/redis.ini
#RUN ln -s /etc/php/7.2/mods-available/swoole.ini /etc/php/7.2/fpm/conf.d/swoole.ini
#RUN ln -s /etc/php/7.2/mods-available/swoole.ini /etc/php/7.2/cli/conf.d/swoole.ini

RUN rm -rf /home/*  && rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y software-properties-common ca-certificates
#启动脚本启动服务
ADD entrypoint.sh /home/entrypoint.sh
ENTRYPOINT ["/home/entrypoint.sh"]

#通过开机启动启动服务
#RUN update-rc.d nginx defaults
#RUN update-rc.d php7.2-fpm defaults
#CMD ["nginx"，"php7.2-fpm"] 测试只能启动一个时可以的
#CMD nohup sh -c '/etc/init.d/nginx start && /etc/init.d/php7.2-fpm start'

