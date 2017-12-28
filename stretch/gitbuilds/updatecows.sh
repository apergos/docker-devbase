#!/bin/bash
for DISTRO in stretch jessie trusty; do
    /usr/sbin/cowbuilder --update --basepath "/var/cache/pbuilder/base-${DISTRO}-amd64.cow"
done
