# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        adoptopenjdk/openjdk8:latest

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN /bin/bash apt-get update -y \
 && /bin/bash apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && /bin/bash useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
