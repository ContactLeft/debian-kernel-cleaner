#!/bin/bash

if [ ! -f /etc/debian_version ]; then
  echo "This Script runs on Debian variants only."
  exit 1
fi

CURRENTKERN=`uname -r`
NEWESTKERN=`dpkg -l | grep -e linux-image-[0-9] | sed -r 's/ +/ /g' | cut -d' ' -f2 | sed s/linux-image-// | tail -1`

CURRENTKERN_VERSION=`echo $CURRENTKERN | sed -r 's/-[^0-9]+$//'`
NEWESTKERN_VERSION=`echo $NEWESTKERN | sed -r 's/-[^0-9]+$//'`

dpkg -l 'linux-*' | grep -e linux-image-[0-9] -e linux-headers-[0-9] | grep ^ii | grep -v $CURRENTKERN_VERSION | grep -v $NEWESTKERN_VERSION | sed -r 's/ +/ /g' | cut -d' ' -f2 | xargs apt-get -y purge 
