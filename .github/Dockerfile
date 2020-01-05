FROM adoptopenjdk:11.0.5_10-jre-hotspot

WORKDIR /github/workspace

RUN ["/bin/bash", "-c", "apt update ;\
apt -y install graphviz ;\
locale-gen ja_JP.UTF-8 ;\
/usr/sbin/update-locale LANG=ja_JP.UTF-8 ;\
apt -y install git git-lfs "]

ENV LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8 LANGUAGE=""

ENTRYPOINT ["/github/workspace/entrypoint.sh"]
