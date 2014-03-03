# base dockerfile for personal testing environment

FROM ubuntu:12.04
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y apt-utils

# set up ppa for hacked libselinux
RUN apt-get install -y python-software-properties && add-apt-repository ppa:ariel-wikimedia/ppa && apt-get update

# no steenkin selinux
RUN apt-get install -y libselinux1

# other stuff we want to have around
RUN apt-get install -y python mg

# ssh access into container
RUN apt-get install -y openssh-server && mkdir -p /var/run/sshd  && echo 'root:testing' |chpasswd

EXPOSE 22

#make sshd response quicker
RUN cat /etc/ssh/sshd_config | sed -e 's/#GSSAPIAuthentication no/GSSAPIAuthentication no/' > /etc/ssh/sshd_config.new
RUN mv /etc/ssh/sshd_config.new /etc/ssh/sshd_config

CMD /usr/sbin/sshd -D
