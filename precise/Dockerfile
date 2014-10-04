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

#make sshd response quicker; allow login as root with password
RUN cat /etc/ssh/sshd_config | sed -e 's/#GSSAPIAuthentication no/GSSAPIAuthentication no/; s/PermitRootLogin without-password/PermitRootLogin yes/' > /etc/ssh/sshd_config.new
RUN mv /etc/ssh/sshd_config.new /etc/ssh/sshd_config

# workaround for auditd or unwriteable /proc or broken pam loginuid module
RUN cat /etc/pam.d/sshd | sed -e 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' > /etc/pam.d/sshd.new
RUN mv /etc/pam.d/sshd.new /etc/pam.d/sshd

# try without much hope
RUN cat /etc/pam.d/login | grep -v pam_selinux.so > /etc/pam.d/login.new
RUN mv /etc/pam.d/login.new /etc/pam.d/login

CMD /usr/sbin/sshd -D
