#!/bin/bash
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

# Update/install server on startup
/steam/steamcmd.sh +force_install_dir /satisfactory +login anonymous +app_update 1690800 -beta public validate +quit

# Ensure permissions are adjusted for the server user
# Config files live in /satisfactory/FactoryGame/Saved/Config/LinuxServer
chown -R satisfactory:satisfactory /satisfactory

# Start the server
sudo -u satisfactory /satisfactory/FactoryServer.sh -multihome=0.0.0.0