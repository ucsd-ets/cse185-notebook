#!/bin/bash

set -e

###### Week 2 ########
# Install sickle
cd /sources
git clone https://github.com/najoshi/sickle
cd sickle
make
cp sickle /usr/local/bin/sickle

# Install jellyfish
cd /sources
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-2.2.10.tar.gz
tar -xzvf jellyfish-2.2.10.tar.gz
cd jellyfish-2.2.10
./configure
make
make install
ldconfig

# Install kmer genie
cd /sources
wget http://kmergenie.bx.psu.edu/kmergenie-1.7051.tar.gz
tar -xzvf kmergenie-1.7051.tar.gz
cd kmergenie-1.7051
python3 setup.py install

# Install minia
cd /sources
git clone --recursive https://github.com/GATB/minia.git
cd minia
sh INSTALL
cp ./build/bin/minia /usr/local/bin/minia

# Install Spades
cd /sources
wget http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0.tar.gz
tar -xzvf SPAdes-3.13.0.tar.gz
cd SPAdes-3.13.0
PREFIX=/usr/local ./spades_compile.sh