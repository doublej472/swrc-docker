FROM --platform=linux/i386 debian:12

COPY repcom/ /repcom/

RUN apt-get update && apt-get install -y wget xpra unzip && rm -rf /var/lib/apt/lists/*
RUN mkdir -pm755 /etc/apt/keyrings && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

RUN apt-get update && apt-get install -y --install-recommends winehq-stable wine-stable-i386:i386 && rm -rf /var/lib/apt/lists/*

COPY files/debian.sources /etc/apt/sources.list.d/debian.sources

# Install SteamCMD in case you want to use it to download repcom manually
RUN apt-get update && echo steamcmd steam/question select "I AGREE" | debconf-set-selections && DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends steamcmd unzip && rm -rf /var/lib/apt/lists/*

COPY overlay/ /repcom/

WORKDIR /repcom/GameData/System

EXPOSE 7777/udp 7777/tcp 11138/udp 11138/tcp

# Repcom ignores SIGTERM, so just send a SIGKILL immediately
STOPSIGNAL SIGKILL

CMD ./start.sh
