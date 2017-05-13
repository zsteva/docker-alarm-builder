#base/archlinux
FROM arch-base:latest
MAINTAINER Zeljko Stevanovic <zsteva@gmail.com>

WORKDIR /
USER root

RUN cd / \
	&& wget -c https://archlinuxarm.org/builder/xtools/x-tools.tar.xz \
	&& wget -c https://archlinuxarm.org/builder/xtools/x-tools6h.tar.xz \
	&& wget -c https://archlinuxarm.org/builder/xtools/x-tools7h.tar.xz \
	&& wget -c https://archlinuxarm.org/builder/xtools/x-tools8.tar.xz \
	&& cd /opt \
	&& tar xvf /x-tools.tar.xz \
	&& tar xvf /x-tools6h.tar.xz \
	&& tar xvf /x-tools7h.tar.xz \
	&& tar xvf /x-tools8.tar.xz

COPY profile-x-tools.sh /etc/profile.d/x-tools.sh

WORKDIR /home/dev
USER dev

ENTRYPOINT /bin/bash -login

