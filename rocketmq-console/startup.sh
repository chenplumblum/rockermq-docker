#!/bin/bash
cd `dirname $0`

docker run -e "JAVA_OPTS=-Drocketmq.namesrv.addr=10.106.108.233:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" \
           -p 8080:8080 \
           -t styletang/rocketmq-console-ng