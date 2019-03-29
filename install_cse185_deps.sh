#!/bin/bash

##### Week 1 ######
# Install samtools (needed to index reference fasta files)
cd /sources
wget -O samtools-1.9.tar.bz2 https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
tar -xjf samtools-1.9.tar.bz2
cd samtools-1.9 
./configure --without-curses && make && make install

# Install BWA mem
cd /sources
git clone https://github.com/lh3/bwa
cd bwa
make
cp bwa /usr/local/bin

# Install FastQC
cd /sources
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
unzip fastqc_v0.11.8.zip
chmod 755 FastQC/fastqc
ln -s /sources/FastQC/fastqc /usr/local/bin/fastqc

###### Week 2 ########
# Install sickle
cd /sources
git clone https://github.com/najoshi/sickle
cd sickle
make
cp sickle /usr/local/bin/sickle

# Install nxtrim
cd /sources
git clone https://github.com/sequencing/NxTrim
cd NxTrim
make
cp nxtrim /usr/local/bin/nxtrim

# Install jellyfish
cd /sources
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-2.2.10.tar.gz
tar -xzvf jellyfish-2.2.10
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
git clone --recursive https://github.com/GATB/minia.git
cd minia
sh INSTALL
