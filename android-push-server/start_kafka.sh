#!/bin/bash

# start zookeeper
echo "Starting zookeeper"
nohup $KAFKA_PATH/bin/zookeeper-server-start.sh $KAFKA_PATH/config/zookeeper.properties 2>&1 > $GOPATH/logs/goim/zookeeper.log &
sleep 10
# start kafka
echo "Starting kafka server"
nohup $KAFKA_PATH/bin/kafka-server-start.sh $KAFKA_PATH/config/server.properties 2>&1 > $GOPATH/logs/goim/kafka.log &
sleep 10
# create kafka topic
echo "Creating topic: KafkaPushsTopic"
$KAFKA_PATH/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic KafkaPushsTopic