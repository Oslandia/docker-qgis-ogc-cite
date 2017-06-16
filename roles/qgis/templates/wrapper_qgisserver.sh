#! /bin/sh

export QGIS_SERVER_LOG_FILE=/var/log/qserv.log
export QGIS_SERVER_LOG_LEVEL=0
/usr/bin/xvfb-run /usr/bin/spawn-fcgi -f /usr/local/bin/qgis_mapserv.fcgi -s /tmp/qgisserver.sock -G www-data -U www-data -n
