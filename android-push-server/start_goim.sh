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
# start router logic comet job modules
cd $GOPATH/bin/
echo "Starting goim-router"
nohup $GOPATH/bin/router -c $GOPATH/bin/router.conf 2>&1 > $GOPATH/logs/goim/panic-router.log &
sleep 1
echo "Starting goim-logic"
nohup $GOPATH/bin/logic -c $GOPATH/bin/logic.conf 2>&1 > $GOPATH/logs/goim/panic-logic.log &
sleep 1
echo "Starting goim-comet"
nohup $GOPATH/bin/comet -c $GOPATH/bin/comet.conf 2>&1 > $GOPATH/logs/goim/panic-comet.log &
sleep 1
cd $GOPATH/bin/
echo "Starting goim-job"
nohup $GOPATH/bin/job -c $GOPATH/bin/job.conf 2>&1 > $GOPATH/logs/goim/panic-job.log &
sleep 1
echo "Done."
