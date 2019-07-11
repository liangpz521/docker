 docker run --privileged \
  -d \
  -p 8888:80 \
  -v /home/eboss/data/www:/usr/share/nginx/html \
  -v /home/eboss/data/docker/lnp/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v /home/eboss/data/docker/lnp/nginx/conf.d:/etc/nginx/conf.d \
  -v /home/eboss/data/docker/lnp/nginx/logs:/var/log/nginx \
  -it --name m_nginx lnmp /bin/bash
