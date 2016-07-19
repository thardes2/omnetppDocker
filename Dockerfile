# DOCKER-VERSION 1.0.0
FROM    ubuntu:latest
MAINTAINER hardes <Tobias.Hardes@autistici.org>,

RUN apt-get -y update
RUN apt-get -y install build-essential gcc g++ bison flex perl tcl-dev tk-dev libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-1.0-0
RUN apt-get -y install qt4-qmake libqt4-dev libqt4-opengl-dev openscenegraph libopenscenegraph-dev openscenegraph-plugin-osgearth osgearth osgearth-data libosgearth-dev
RUN apt-get -y install wget xvfb openmpi-bin libopenmpi-dev

# Create working directory
RUN mkdir -p /usr/omnetpp
WORKDIR /usr/omnetpp

# Download omnetpp from "my" server - the original source doesn't support direct downloads...
RUN wget http://thardes.com/omnetpp-5.0-src.tgz
RUN tar -xvzf omnetpp-5.0-src.tgz

# Execute steps based on the installation manual
#RUN sed -i "/WITH_TKENV=yes/c\WITH_TKENV=no"
#ENV DISPLAY=:0.0
ENV PATH $PATH:/usr/omnetpp/omnetpp-5.0/bin
RUN cd omnetpp-5.0 && ./configure WITH_TKENV=no && make
