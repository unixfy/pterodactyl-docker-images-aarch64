# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        adoptopenjdk/openjdk8:latest

LABEL       author="Alex Wang" maintainer="admin@unixfy.me"

RUN apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

RUN         chmod +x /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
