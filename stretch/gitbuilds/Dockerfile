FROM ariel/devstretch:base

# set up apt properly
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y build-essential dpkg-dev devscripts debhelper quilt autoconf automake dh-make git fakeroot pbuilder
RUN apt-get install -y cowbuilder cdbs dh-autoreconf openstack-pkg-tools git-buildpackage wdiff lintian
RUN apt-get install -y zip unzip debian-archive-keyring ubuntu-archive-keyring

ADD ./pbuilderrc /etc/pbuilderrc
ADD ./buildcows.sh /root/buildcows.sh
ADD ./updatecows.sh /root/updatecows.sh
ADD ./quiltrc-dpkg /root/.quiltrc-dpkg
ADD ./root_gitconfig /root/.gitconfig
ADD ./bashrc_addons /root/bashrc_addons

RUN cat /root/bashrc_addons >> /root/.bashrc

RUN mkdir /root/stretch /root/jessie /root/trusty
ADD stretch_hook /root/stretch/D01apt.wikimedia.org
ADD jessie_hook /root/jessie/D01apt.wikimedia.org
ADD trusty_hook /root/trusty/D01apt.wikimedia.org

RUN apt-get install -y bash-completion dh-systemd python-sphinx python-debian emacs meld


EXPOSE 22
CMD /usr/sbin/sshd -D
