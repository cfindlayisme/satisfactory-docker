#!/bin/bash
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

# Update/install server on startup
/steam/steamcmd.sh +force_install_dir /satisfactory +login anonymous +app_update 1690800 -beta public validate +quit

# Start the server
/satisfactory/FactoryServer.sh