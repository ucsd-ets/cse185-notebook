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

# Install bfc kmer error correction
cd /sources
git clone https://github.com/lh3/bfc
cd bfc
make
cp bfc /usr/local/bin/bfc

# Install SSPACE
cd /sources
wget https://github.com/BenLangmead/bowtie/releases/download/v1.2.2_p1/bowtie-1.2.2-linux-x86_64.zip
unzip bowtie-1.2.2-linux-x86_64.zip
cd bowtie-1.2.2-linux-x86_64
cp bowtie* /usr/local/bin/
cd /sources
git clone https://github.com/nsoranzo/sspace_basic
cd sspace_basic
cp SSPACE_Basic_v2.0.pl /usr/local/bin/SSPACE_Basic_v2.0.pl
export PERL5LIB=$PERL5LIB:/sources/sspace_basic/dotlib # TODO do we need to set ENV in dockerfile?
cp -r /sources/sspace_basic/bin /usr/local/bin/
