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
