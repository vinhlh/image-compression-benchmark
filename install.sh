#!/bin/bash
LIBJPEG_VERSION=1.5.1
MOZJPEG_VERSION=3.2
GUETZLI_VERSION=1.0.1

# Install libjpeg
sudo apt-get install -y autoconf automake libtool nasm make pkg-config
wget --no-check-certificate https://github.com/libjpeg-turbo/libjpeg-turbo/archive/$LIBJPEG_VERSION.tar.gz
tar -xvzf libjpeg-turbo-$LIBJPEG_VERSION.tar.gz
cd libjpeg-turbo-$LIBJPEG_VERSION
autoreconf -fiv
./configure
make
cd ../
# /home/ubuntu/libjpeg-turbo-$LIBJPEG_VERSION/jpegtran

# Install mozjpeg
wget --no-check-certificate https://github.com/mozilla/mozjpeg/archive/v$MOZJPEG_VERSION.tar.gz
tar -xvzf v$MOZJPEG_VERSION.tar.gz
cd mozjpeg-$MOZJPEG_VERSION
autoreconf -fiv
./configure
make
cd ../

# Install guetzli
wget --no-check-certificate https://github.com/google/guetzli/releases/download/v$GUETZLI_VERSION/guetzli_linux_x86-64
sudo chmod +x guetzli_linux_x86-64
sudo mv guetzli_linux_x86-64 /usr/bin/guetzli
