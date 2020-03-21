FROM ucsdets/datascience-notebook:2019.4-stable

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    cmake \
    datamash \
    default-jdk \
    git \
    less \
    libbz2-dev \
    liblzma-dev \
    libncurses5 libncurses5-dev \
    r-base \
    vim \
    zlib1g-dev

# Make sources directory
RUN mkdir /sources

# Install extra python packages
RUN pip install pyvcf

# Install course-specific software
ADD install_cse185_deps_wks1-3.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wks1-3.sh
RUN /sources/install_cse185_deps_wks1-3.sh

ADD install_cse185_deps_wk4.sh /sources/
RUN chmod +x /sources/install_cse185_deps_wk4.sh
RUN /sources/install_cse185_deps_wk4.sh

ADD install_cse185_deps_wk5.sh /sources
RUN chmod +x /sources/install_cse185_deps_wk5.sh
RUN /sources/install_cse185_deps_wk5.sh

RUN rm /sources/*.tar.gz
RUN rm /sources/*.zip
RUN rm -rf /opt/julia
ADD install_cse185_deps_wk6.sh /sources
RUN chmod +x /sources/install_cse185_deps_wk6.sh
RUN /sources/install_cse185_deps_wk6.sh

# Set env variables
ENV PERL5LIB="${PERL5LIB}:/sources/sspace_basic/dotlib"
ENV PATH="${PATH}:/sources/homer/bin:/sources/meme-5.0.5/src/"

# Software requested for projects
RUN apt-get update && apt-get install -y binutils libproj-dev gdal-bin
RUN mkdir -p /opt/geopandas/build/
COPY requirements.txt /opt/geopandas/build/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /opt/geopandas/build/requirements.txt
