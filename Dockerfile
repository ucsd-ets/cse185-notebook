FROM jupyter/datascience-notebook:a95cb64dfe10

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    default-jdk \
    git \
    libbz2-dev \
    liblzma-dev \
    zlib1g-dev

# Make sources directory
RUN mkdir /sources

# Install extra python packages
RUN pip install pyvcf

# Install course-specific software
ADD install_cse185_deps.sh /sources/
RUN chmod +x /sources/install_cse185_deps.sh
RUN /sources/install_cse185_deps.sh

# Set working directory
WORKDIR /home/jovyan