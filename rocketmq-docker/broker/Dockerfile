# Start from a base image.
FROM rocketmq-base-image:4.6.0

# Rocketmq version
ENV ROCKETMQ_VERSION 4.6.0

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
		/opt/logs \
	    /opt/store

RUN ls ${ROCKETMQ_HOME}
RUN chmod +x bin/mqbroker

ENV BROKER_IP1 rocketmq-broker-a-m
ENV LISTEN_PORT 10911
ENV PROPERTIES_FILE "2m-2s-async/broker-a.properties"

VOLUME /opt/logs \
		/opt/store

ENV JAVA_OPT=" -Duser.home=/opt"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR ${ROCKETMQ_HOME}/bin
ENTRYPOINT ["/entrypoint.sh"]
