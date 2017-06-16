#!/bin/sh

TARGET=$1
ACTION=$2
YAML=""
CONTAINER=""
IMAGE=""

export PYTHONPATH=$PYTHONPATH:$(pwd)/venv/lib/python2.7/site-packages/

case "$TARGET" in
  "all")
    IMAGE="qgis-server-ogc-cite"
    CONTAINER="oslandia-$IMAGE"
    YAML=all.yml
    ;;
  "qgis")
    IMAGE="qgis-server"
    CONTAINER="oslandia-$IMAGE"
    YAML=qgis.yml
    ;;
  *)
    echo "Error: invalid target"
    exit 1
esac

if [ ! -n "$ACTION" ]
then
  ansible-playbook -i "localhost," -c local $YAML -vvv
else
  case "$ACTION" in
    "connect")
      docker exec -i -t $CONTAINER /bin/bash
      ;;
    "run")
      docker run --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup -d $CONTAINER
      ;;
    "image")
      docker commit $CONTAINER oslandia/$IMAGE:latest
      ;;
    *)
      echo "Error: invalid action"
      exit 1
  esac
fi

exit 0
