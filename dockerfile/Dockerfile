FROM ubuntu:xenial
MAINTAINER lzc@fortunes.com.cn

RUN apt-get update
RUN apt-get install -y gcc git python-dev python-pip python3 supervisor vim autoconf automake intltool libtool make g++ cmake
RUN apt-get install -y gobject-introspection libjansson-dev uuid-dev libsqlite3-dev libssl-dev valac libfuse-dev libcurl4-openssl-dev libevent-dev libzdb-dev libonig-dev libarchive-dev file libs3-dev memcached libmemcached-dev python-djangorestframework python-django gunicorn python-eventlet python-dateutil python3-crypto python-django-cors-headers
RUN pip install whitenoise

ADD ./source /root/source
ADD ./deploy.sh  /root/source/
ADD ./supervisord.conf /etc/supervisord.conf

RUN bash /root/source/deploy.sh
CMD ["supervisord", "-n"]
