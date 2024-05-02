# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM gitea.findlayis.me/chuck/steamcmd:latest

COPY run.sh /run.sh

RUN apt update && apt install -y sudo && \
    useradd -m -d /satisfactory satisfactory && \
    chown -R satisfactory:satisfactory /satisfactory && \
    mkdir -p /satisfactory/FactoryGame/Saved/Config/LinuxServer

CMD ["/run.sh"]