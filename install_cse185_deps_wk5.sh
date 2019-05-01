#!/bin/bash

set -e

##### Week 5 ######
apt-get install -y ghostscript

# Homer
mkdir /sources/homer
cd /sources/homer
wget http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install

# Seqlogo
pip install weblogo==3.6.0
pip install seqlogo

# Meme
cd /sources
wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz
tar -xzvf meme-5.0.5.tar.gz
cd meme-5.0.5
./configure --with-url=http://meme-suite.org/ --enable-build-libxml2 --enable-build-libxslt
make && make install


