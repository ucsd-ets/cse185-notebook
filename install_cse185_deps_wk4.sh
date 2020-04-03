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

# DESeq2
R -e "install.packages('readr', dependencies=TRUE, repos='http://cran.rstudio.com/')"
R -e "install.packages('BiocManager', dependencies=TRUE, repos='http://cran.rstudio.com/')"
R -e "BiocManager::install('DESeq2', version = '3.10')"
R -e "BiocManager::install('tximport', version = '3.10')"
pip install simplegeneric
