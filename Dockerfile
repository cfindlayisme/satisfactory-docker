# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM gitea.findlayis.me/chuck/steamcmd:latest

COPY run.sh /run.sh

RUN apt update && apt install -y sudo && \
    useradd -m -d /satisfactory satisfactory && \
    mkdir -p /satisfactory/FactoryGame/Saved/Config/LinuxServer && \
    mkdir -p /satisfactory/.config/Epic/FactoryGame/Saved/SaveGames && \
    chown -R satisfactory:satisfactory /satisfactory

EXPOSE 15777/udp 15000/udp 7777/udp
CMD ["/run.sh"]