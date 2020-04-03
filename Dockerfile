FROM ucsdets/datascience-notebook:2019.4-stable

MAINTAINER Melissa Gymrek <mgymrek@ucsd.edu>
USER root

# Install dependencies
RUN apt-get update && apt-get -qq install -y \
    automake \
    cmake \
    datamash \
    default-jdk \
    git \
    less \
    libbz2-dev \
    liblzma-dev \
    libncurses5 libncurses5-dev \
    vim \
    zlib1g-dev \
    software-properties-common

# uninstall R from conda and install manually
RUN conda remove r-base -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get update
RUN apt-get install r-base-dev -y

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

RUN rm /sources/*.tar.gz
RUN rm /sources/*.zip
RUN rm -rf /opt/julia

ADD install_cse185_deps_wk5.sh /sources
RUN chmod +x /sources/install_cse185_deps_wk5.sh
RUN /sources/install_cse185_deps_wk5.sh

#ADD install_cse185_deps_wk6.sh /sources
#RUN chmod +x /sources/install_cse185_deps_wk6.sh
#RUN /sources/install_cse185_deps_wk6.sh

# Set env variables
ENV PERL5LIB="${PERL5LIB}:/sources/sspace_basic/dotlib"
ENV PATH="${PATH}:/sources/homer/bin:/sources/meme-5.0.5/src/"
