#!/bin/bash

SOURCE_ROOT="/root/source"
RUN_ROOT="/opt/ruifile"


function deploy_libsearpc {
	./autogen.sh
	./configure
	make
	make install
	ldconfig

}

function deploy_ccnet {
	export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
	./autogen.sh
	./configure --disable-client --enable-server --enable-python
	make
	make install
	ldconfig
}

function deploy_libevhtp {
	cmake -DEVHTP_DISABLE_SSL=ON -DEVHTP_BUILD_SHARED=ON .
	make
	make install
	ldconfig
}

function deploy_seafile {
	./autogen.sh
	./configure --disable-client --enable-server
	make
	make install
	ldconfig
}

function deploy_ruihub {
	python setup.py install
	python ruihub/manage.py migrate --noinput
}

function deploy {

	cd ${SOURCE_ROOT}/libsearpc
	deploy_libsearpc

	cd ${SOURCE_ROOT}/libevhtp
	deploy_libevhtp

	cd ${SOURCE_ROOT}/ccnet
	deploy_ccnet

	cd ${SOURCE_ROOT}/ruifile
	deploy_seafile

        mkdir ${RUN_ROOT}
        cd ${RUN_ROOT}
        ruifile-admin setup

	cd ${SOURCE_ROOT}/ruihub
	deploy_ruihub

        touch ${RUN_ROOT}/done
}

if [ ! -d ${RUN_ROOT}/done ];then
	deploy
fi
