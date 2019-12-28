# Start from a Java image.
FROM java:8-jre

# Rocketmq version
ENV ROCKETMQ_VERSION 4.6.0

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}
RUN echo ${ROCKETMQ_VERSION}
WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
		/opt/logs \
	    /opt/store
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip
RUN mkdir  bak
RUN unzip rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -d ./bak
COPY apache-rocketmq-all/ ./
RUN rm -rf lib
RUN cp -r ./bak/lib ./
RUN rm -rf bak

VOLUME /opt/logs \
		/opt/store