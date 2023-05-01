FROM ucsdets/datascience-notebook:2023.2-stable

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    automake \
    bison \
    cmake \
    datamash \
    default-jdk \
    flex \
    git \
    g++ \
    less \
    libbz2-dev \
    liblzma-dev \
    libncurses5 libncurses5-dev \
    libtool \
    openssh-client \
    vim \
    zip \
    zlib1g-dev \
    software-properties-common

# Make sources directory
RUN mkdir /sources

# Install extra python packages
RUN pip install pyvcf

# DESeq2
RUN R -e "install.packages('readr', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('BiocManager', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "BiocManager::install('DESeq2')"
RUN R -e "BiocManager::install('tximport')"

# Install lab-specific software
ADD install_cse185_deps_wk1.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wk1.sh
RUN /sources/install_cse185_deps_wk1.sh

ADD install_cse185_deps_wk2.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wk2.sh
RUN /sources/install_cse185_deps_wk2.sh

RUN apt-get -qq install -y pkg-config
ADD install_cse185_deps_wk3.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wk3.sh
RUN /sources/install_cse185_deps_wk3.sh

ADD install_cse185_deps_wk4.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wk4.sh
RUN /sources/install_cse185_deps_wk4.sh

ADD install_cse185_deps_wk5.sh /sources
RUN chmod +x /sources/install_cse185_deps_wk5.sh
RUN /sources/install_cse185_deps_wk5.sh

ADD install_cse185_deps_wk6.sh /sources
RUN chmod +x /sources/install_cse185_deps_wk6.sh
RUN /sources/install_cse185_deps_wk6.sh

# Set env variables
ENV PATH="${PATH}:/sources/homer/bin:/sources/meme-5.0.5/src/"

RUN rm /sources/*.tar.gz
RUN rm /sources/*.zip
RUN rm -rf /opt/julia

#RUN apt-get update && apt-get -qq install -y man-db
#RUN set +o pipefail && yes | unminimize

COPY late.py /usr/local/etc/jupyter/late.py
RUN chmod a+w /usr/local/etc/jupyter/late.py

USER $NB_USER
