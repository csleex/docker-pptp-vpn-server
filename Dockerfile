FROM ubuntu:16.04
MAINTAINER Sam Stoelinga <sammiestoel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
    apt-get install -y pptpd iptables &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
