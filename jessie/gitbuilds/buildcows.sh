#!/bin/bash

mkdir -p /var/cache/pbuilder/hooks/precise /var/cache/pbuilder/hooks/trusty /var/cache/pbuilder/hooks/jessie
cp /root/jessie/D01apt.wikimedia.org /var/cache/pbuilder/hooks/jessie
cp /root/trusty/D01apt.wikimedia.org /var/cache/pbuilder/hooks/trusty
cp /root/precise/D01apt.wikimedia.org /var/cache/pbuilder/hooks/precise

/usr/sbin/cowbuilder --create --mirror http://mirrors.wikimedia.org/debian --distribution jessie --components main --architecture amd64 --basepath /var/cache/pbuilder/base-jessie-amd64.cow --debootstrapopts --variant=buildd --debootstrapopts --keyring=/usr/share/keyrings/debian-archive-keyring.gpg

/usr/sbin/cowbuilder --create --mirror http://mirrors.wikimedia.org/ubuntu --distribution trusty --components "main universe" --architecture amd64 --basepath /var/cache/pbuilder/base-trusty-amd64.cow --debootstrapopts --variant=buildd --debootstrapopts --keyring=/usr/share/keyrings/ubuntu-archive-keyring.gpg

/usr/sbin/cowbuilder --create --mirror http://mirrors.wikimedia.org/ubuntu --distribution precise --components "main universe" --architecture amd64 --basepath /var/cache/pbuilder/base-precise-amd64.cow --debootstrapopts --variant=buildd --debootstrapopts --keyring=/usr/share/keyrings/ubuntu-archive-keyring.gpg
