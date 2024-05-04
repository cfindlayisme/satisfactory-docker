#!/bin/bash
#
# Start script handler for GCP satisfactory-docker image
#
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

echo "0 */1 * * * gcloud auth activate-service-account --key-file=/gcs-key.json && gsutil -m cp -r /satisfactory/FactoryGame/Saved/Config/LinuxServer gs://$GCS_BUCKET$GCS_BUCKET_PATH/" > /etc/cron.d/gcs-hourly-backup
chmod 0644 /etc/cron.d/gcs-hourly-backup-config
crontab /etc/cron.d/gcs-hourly-backup-config

echo "0 */1 * * * gcloud auth activate-service-account --key-file=/gcs-key.json && gsutil -m cp -r /satisfactory/.config/Epic/FactoryGame/Saved/SaveGames gs://$GCS_BUCKET$GCS_BUCKET_PATH/" > /etc/cron.d/gcs-hourly-backup
chmod 0644 /etc/cron.d/gcs-hourly-backup-saves
crontab /etc/cron.d/gcs-hourly-backup-saves

# Start cron so it runs auto backups
cron

# Authenticate to GCS
gcloud auth activate-service-account --key-file=/gcs-key.json

# Copy files from GCS to /root (so /satisfactory/FactoryGame/Saved/Config/LinuxServer is there) and save files
gsutil -m cp -r gs://$GCS_BUCKET$GCS_BUCKET_PATH/LinuxServer /satisfactory/FactoryGame/Saved/Config/
gsutil -m cp -r gs://$GCS_BUCKET$GCS_BUCKET_PATH/SaveGames /satisfactory/.config/Epic/FactoryGame/Saved/SaveGames

/run.sh

# Copy files again once the server is done
gsutil -m cp -r /satisfactory/FactoryGame/Saved/Config/LinuxServer gs://$GCS_BUCKET$GCS_BUCKET_PATH/
gsutil -m cp -r /satisfactory/.config/Epic/FactoryGame/Saved/SaveGames gs://$GCS_BUCKET$GCS_BUCKET_PATH/