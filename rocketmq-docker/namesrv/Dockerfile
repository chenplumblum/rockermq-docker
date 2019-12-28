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

RUN chmod +x bin/mqnamesrv

VOLUME /opt/logs \
		/opt/store

ENV JAVA_OPT=" -Duser.home=/opt"

WORKDIR ${ROCKETMQ_HOME}/bin

CMD sh mqnamesrv