FROM ubuntu:20.04

# Setup python and java and base system
ENV DEBIAN_FRONTEND noninteractive
# ENV LANG=en_US.UTF-8

# Install Python 3.8
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y ant && \
    apt-get clean;
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/

# Install SUMO
RUN apt-get install -y software-properties-common && \
  add-apt-repository ppa:sumo/stable && \
  apt-get update && \
  apt-get install -y sumo sumo-tools sumo-doc

# Install Jupyter Lab
RUN pip install jupyterlab

WORKDIR /connecticity/client

# CMD jupyter lab --allow-root
