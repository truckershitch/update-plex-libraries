#!/bin/bash
#
# Run every 5 minutes in cron
# Be sure to update TVSECTION and MOVIESECTION if Plex changes
# run: /usr/lib/plexmediaserver/Plex\ Media\ Scanner --list
# after setting environment variables listed below
# NB: perhaps add --force but it says:
# You can perform the same thing that occurs when you choose to 
# "Force Refresh" in the Media Manager, which is to do a Force Refresh
# of metadata for all items in the section
#

export LD_LIBRARY_PATH="/usr/lib/plexmediaserver"
export LANG="en_US.UTF-8"
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS="6"
export PLEX_MEDIA_SERVER_TMPDIR="/tmp"
export PLEX_MEDIA_SERVER_HOME="/usr/lib/plexmediaserver"
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/var/lib/plexmediaserver/Library/Application Support"

FLAGDATE=`date "+%R" -d "6 mins ago"`
NEWTV=`find /storage/videos/plex/TV -newermt $FLAGDATE`
NEWMOVIES=`find /storage/videos/plex/Movies -newermt $FLAGDATE`
TVSECTION=2
MOVIESECTION=3


if [ -n "$NEWTV" ]
    then
        /usr/lib/plexmediaserver/Plex\ Media\ Scanner --scan --refresh --section $TVSECTION
fi

if [ -n "$NEWMOVIES" ]
    then
        /usr/lib/plexmediaserver/Plex\ Media\ Scanner --scan --refresh --section $MOVIESECTION
fi
