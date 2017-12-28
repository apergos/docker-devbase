#!/bin/bash

set_distro_args() {
  DISTRO=$1
  cowbuilder_distro_args="--distribution ${DISTRO} --basepath /var/cache/pbuilder/base-${DISTRO}-amd64.cow"
}

for distro in trusty jessie stretch; do
    mkdir -p /var/cache/pbuilder/hooks/${distro}
    cp /root/stretch/D01apt.wikimedia.org /var/cache/pbuilder/hooks/${distro}
done

cowbuilder_standard_args="--create --mirror http://mirrors.wikimedia.org/debian --architecture amd64 --debootstrapopts --variant=buildd --debootstrapopts --keyring=/usr/share/keyrings/debian-archive-keyring.gpg"


set_distro_args stretch ; /usr/sbin/cowbuilder $cowbuilder_standard_args $cowbuilder_distro_args --components main
set_distro_args jessie ; /usr/sbin/cowbuilder $cowbuilder_standard_args $cowbuilder_distro_args --components main
set_distro_args trusty ; /usr/sbin/cowbuilder $cowbuilder_standard_args $cowbuilder_distro_args --components "main universe"
