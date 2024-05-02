# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM gitea.findlayis.me/chuck/steamcmd:latest

COPY run.sh /run.sh

CMD ["/bin/bash"]