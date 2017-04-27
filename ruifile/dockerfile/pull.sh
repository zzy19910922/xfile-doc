#!/bin/bash

if [ ! -d source ];then
    mkdir source
fi

cd source

if [ ! -d ruihub ];then
    git clone git@github.com:cloudgz/ruihub.git
fi

if [ ! -d ruifile ];then
    git clone git@github.com:cloudgz/ruifile.git
fi

if [ ! -d ccnet ];then
    git clone git@github.com:cloudgz/ccnet.git
fi

if [ ! -d libsearpc ];then
    git clone https://github.com/haiwen/libsearpc.git
fi

if [ ! -d libevhtp ];then
    git clone https://github.com/haiwen/libevhtp.git
fi
