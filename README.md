# docker-qgis-ogc-cite

## How to

Prepare the environment:

````
$ virtualenv -p /usr/bin/python2.7 venv
$ source venv/bin/activate
$ pip install -r requirements.pip
````

Bring up the docker container and provisionning it:

````
$ ./docker.sh all
````

Connect to the container:

````
$ ./docker.sh all connect
````

Build an image from the container:

````
$ ./docker.sh all image
````

Run the image:

````
$ docker run --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup -d oslandia/qgis-server-ogc-cite
````

Push the image on docker hub:

````
$ docker push oslandia/qgis-server-ogc-cite:<tag>
````


## Teamengine

Installation steps: http://opengeospatial.github.io/teamengine/installation.html

URL (where <CONTAINER_IP> can be retrieved thanks to `docker inspect`):

````
http://<CONTAINER_IP>:8080/teamengine/
````

Run QGIS Capabilities for WMS 1.3.0:

````
http://<CONTAINER_IP>/qgisserver?REQUEST=GetCapabilities&SERVICE=WMS&VERSION=1.3.0&MAP=/home/user/teamengine_wms_130.qgs
````

Run OGC test suite for WMS 1.3.0 on Qgis Server:

````
http://<CONTAINER_IP>:8080/teamengine/rest/suites/wms/1.20/run?capabilities-url=http:/
/<CONTAINER_IP>/qgisserver?REQUEST=GetCapabilities%26SERVICE=WMS%26VERSION=1.3.0%26MAP=/home/user/teamengine_wms_130.qgs
````

To take a look on teamengine log files:

````
$ tail -f /srv/tomcat/teamengine/logs/catalina.out
````

## ETS references

WMS 1.1.1: http://opengeospatial.github.io/ets-wms11/

WMS 1.3.0: http://opengeospatial.github.io/ets-wms13/

WMS SLD 1.1.0: http://htmlpreview.github.io/?https://github.com/opengeospatial/ets-wms-sld11/blob/master/src/main/web/index.html

WFS 1.0.0: http://opengeospatial.github.io/ets-wfs10/

WFS 1.1.0: http://opengeospatial.github.io/ets-wfs11/

WFS 2.0: http://opengeospatial.github.io/ets-wfs20/

WCS 1.0.0: http://opengeospatial.github.io/ets-wcs10/

WCS 1.1.1: http://opengeospatial.github.io/ets-wcs11/

WCS 2.0: http://opengeospatial.github.io/ets-wcs20/
