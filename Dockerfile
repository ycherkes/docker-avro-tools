FROM java:8
MAINTAINER coderfi@gmail.com

ENV AVRO_VERSION 1.10.0
ENV AVRO_TOOLS_JAR /usr/share/java/avro-tools-${AVRO_VERSION}.jar

RUN mkdir -p /usr/share/java \
 && cd /usr/share/java \
 && wget http://mirrors.gigenet.com/apache/avro/avro-${AVRO_VERSION}/java/avro-tools-${AVRO_VERSION}.jar

WORKDIR /share

ADD avro-tools-runner /usr/local/bin/avro-tools-runner
ENTRYPOINT ["bash", "avro-tools-runner"]

CMD ["--help"]