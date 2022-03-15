# Pull Ubuntu Impish, which comes with the M2 repo
FROM ubuntu:21.10

# skip all optional parameters for the installation
ENV DEBIAN_FRONTEND=noninteractive 

# Update the os, install macaulay 2, and remove some stuff (what does the last line remove?)
RUN apt-get update && apt install -y macaulay2 \
    && rm -rf var/lib/apts/lists/* 
