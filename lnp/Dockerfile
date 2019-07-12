FROM ubuntu
MAINTAINER Michael Crosby <michael@crosbymichael.com>
# 设置时区
ENV TZ=Asia/Shanghai

RUN apt-get update && \
apt-get install -y vim --no-install-recommends  software-properties-common ca-certificates tzdata  && \
add-apt-repository -y ppa:ondrej/php && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt-get update && \
apt-get install -y wget \
	curl \
	make \
	php7.1-cli \
	php7.1-common \
	php7.1-dev \
	php7.1-fpm \
	php7.1-mysql \
	php7.1-curl \
	php7.1-gd \
	php7.1-zip \
	php7.1-imap \
	php7.1-xmlrpc \
	php7.1-zip \
	php7.1-xsl \
	nginx && \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
#	&& \rm -rf /var/lib/apt/lists/*


WORKDIR /home
RUN apt-get install -y build-essential g++ && \
wget http://pecl.php.net/get/redis-5.0.0.tgz && \
tar -zxvf redis-5.0.0.tgz  && \
cd redis-5.0.0 && /usr/bin/phpize7.1 && ./configure && make && make install && \
echo "extension=redis.so" >> /etc/php/7.1/mods-available/redis.ini && \
ln -s /etc/php/7.1/mods-available/redis.ini /etc/php/7.1/fpm/conf.d/redis.ini && \
ln -s /etc/php/7.1/mods-available/redis.ini /etc/php/7.1/cli/conf.d/redis.ini && \
cd /home/ && \
wget http://pecl.php.net/get/swoole-4.4.0.tgz && \
tar -zxvf swoole-4.4.0.tgz && \
cd swoole-4.4.0 && /usr/bin/phpize7.1 && ./configure && make && make install && \
echo "extension=swoole.so" >> /etc/php/7.1/mods-available/redis.ini && \
ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/fpm/conf.d/swoole.ini && \
ln -s /etc/php/7.1/mods-available/swoole.ini /etc/php/7.1/cli/conf.d/swoole.ini && \
rm -rf /home/*  && rm -rf /var/lib/apt/lists/* && \
apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
apt-get autoremove -y build-essential g++
#启动脚本启动服务
ADD entrypoint.sh /home/entrypoint.sh
RUN chmod u+x /home/entrypoint.sh
ENTRYPOINT ["/home/entrypoint.sh"]
# 对其他容器开放9000端口
EXPOSE 9000 9510 80

#通过开机启动启动服务
#RUN update-rc.d nginx defaults
#RUN update-rc.d php7.1-fpm defaults
#CMD ["nginx"，"php7.1-fpm"] 测试只能启动一个时可以的
#CMD nohup sh -c '/etc/init.d/nginx start && /etc/init.d/php7.1-fpm start'

