# update-plex-libraries
Cron script to run Plex Media Scanner when new media is added.

Read script comments.  Change paths and environmental variables before running.

This should be run every 5 minutes or whenever needed.

Add this to /etc/crontab or edit the root user's crontab, changing the path to the script as necessary:

*/5  *  *  *  * root        /home/truckershitch/bin/update_plex.sh 2>&1
