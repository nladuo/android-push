#!/bin/bash


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
