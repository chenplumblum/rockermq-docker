# RocketMQ Sample
docker-rocketMQ for 4.2.0 version

+ namesrv: RocketMQ Name Server
+ broker-m: RocketMQ Broker

### Usage:

#### single launching rocketMQ:
```
docker-compose up -d
```

### Multiline Point Settings
#### Master Environment
```yaml
#Namesrv master
    environment:
      NAMESRV_ADDR: "master:9876;slave:9876"
#Broker master
NAMESRV_ADDR: "master:9876;slave:9876"
PROPERTIES_FILE: "2m-2s-async/broker-a.properties"
brokerIP1: "master"
brokerName: "broker-a"
brokerId: "0"
brokerClusterName: "name"
```
#### Slave Environment
```yaml
#Namesrv slave
    environment:
      NAMESRV_ADDR: "master:9876;slave:9876"
#Broker Slave
NAMESRV_ADDR: "slave:9876;slave:9876"
PROPERTIES_FILE: "2m-2s-async/broker-a-s.properties"
brokerIP1: "slave"
brokerName: "broker-a"
brokerId: "1"
brokerClusterName: "name"
```

### Reference
[RockerMQ Docker - Github](https://github.com/leechedan/docker-rocketmq)
