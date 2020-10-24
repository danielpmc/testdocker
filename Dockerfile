FROM ubuntu:16.04

MAINTAINER danielpmc, <danielpd93@gmail.com>

RUN apt update \
    && apt upgrade -y \
    && apt -y install curl software-properties-common locales git lxde tightvncserver \
    && apt-get install -y openjdk-8-jdk \
    && useradd -d /home/container -m container \
    && apt-get update

    # Grant sudo permissions to container user for commands
RUN apt-get update && \
    apt-get -y install sudo

    # Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

    
# Install basic software support
RUN apt-get update && \
    apt-get install --yes software-properties-common
    

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
