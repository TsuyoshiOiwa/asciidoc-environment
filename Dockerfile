FROM adoptopenjdk:11.0.5_10-jre-hotspot

WORKDIR /asciidoc-environment

RUN ["/bin/bash", "-c", "apt update ;\
apt -y install graphviz ;\
locale-gen ja_JP.UTF-8 ;\
/usr/sbin/update-locale LANG=ja_JP.UTF-8 ;"]

ENV LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8 LANGUAGE=""
