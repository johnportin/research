FROM ubuntu:21.10

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt install -y macaulay2 \
    && rm -rf var/lib/apts/lists/* 
