#!/bin/bash

# start zookeeper
$KAFKA_PATH/bin/zookeeper-server-start.sh $KAFKA_PATH/config/zookeeper.properties 2>&1 > $GOPATH/logs/goim/zookeeper.log
# start kafka
$KAFKA_PATH/bin/kafka-server-start.sh $KAFKA_PATH/config/server.properties 2>&1 > $GOPATH/logs/goim/kafka.log
# create kafka topic
$KAFKA_PATH/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic KafkaPushsTopic
# start router logic comet job modules
nohup $GOPATH/bin/router -c $GOPATH/bin/router.conf 2>&1 > $GOPATH/logs/goim/panic-router.log &
nohup $GOPATH/bin/logic -c $GOPATH/bin/logic.conf 2>&1 > $GOPATH/logs/goim/panic-logic.log &
nohup $GOPATH/bin/comet -c $GOPATH/bin/comet.conf 2>&1 > $GOPATH/logs/goim/panic-comet.log &
nohup $GOPATH/bin/job -c $GOPATH/bin/job.conf 2>&1 > $GOPATH/logs/goim/panic-job.log &

