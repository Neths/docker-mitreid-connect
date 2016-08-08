FROM neths/docker-alpine-java-tomcat

MAINTAINER gca <@grkcnmq>

VOLUME ["/opt/tomcat/webapps"]

WORKDIR /

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

