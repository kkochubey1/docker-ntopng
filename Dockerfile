FROM ubuntu:14.04.2
MAINTAINER L. Deri <deri@ntop.org>

RUN apt-get update
RUN apt-get -y -q install curl
RUN curl -s --remote-name http://packages.ntop.org/apt/14.04/all/apt-ntop.deb
RUN sudo dpkg -i apt-ntop.deb
RUN rm -rf apt-ntop.deb

RUN apt-get update
RUN apt-get install -y -q libpcap-dev libglib2.0-dev libgeoip-dev redis-server libxml2-dev libnl1
RUN apt-get install -y -q ntopng pfring nprobe ntopng-data n2disk
RUN apt-get install -y -f
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run.sh /

# VOLUME ["/var/lib/redis", "/var/lib/ntop"]

ENTRYPOINT ["/bin/bash", "/run.sh"]
CMD ["-w 3000"]
