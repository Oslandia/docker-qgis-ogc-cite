#! /bin/sh

export TE_BASE="/srv/teamengine"
export CATALINA_BASE="/srv/tomcat/teamengine"
export CATALINA_PID="/srv/tomcat/teamengine/temp/teamengine.pid"
# export CATALINA_OPTS="-server -Xmx1024m -DTE_BASE=$TE_BASE -Dderby.system.home=$DERBY_DATA"
export CATALINA_OPTS="-server -DTE_BASE=$TE_BASE -Dderby.system.home=$DERBY_DATA"
