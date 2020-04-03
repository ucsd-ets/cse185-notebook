#!/bin/bash

set -e

##### Week 4 ######

# STAR
cd /sources
wget https://github.com/alexdobin/STAR/archive/2.7.0f.tar.gz
tar -xzf 2.7.0f.tar.gz
cd STAR-2.7.0f/source
make -j STAR
cp STAR /usr/local/bin

# Rsem
cd /sources
wget https://github.com/deweylab/RSEM/archive/v1.3.1.tar.gz
tar -xzvf v1.3.1.tar.gz
cd RSEM-1.3.1/
make && make install

# goatools
cd /sources
pip install git+git://github.com/tanghaibao/goatools.git

