#!/bin/bash

cd $GOPATH/src/goim/router
go install
cp router-example.conf $GOPATH/bin/router.conf
cp router-log.xml $GOPATH/bin/
cd ../logic/
go install
cp logic-example.conf $GOPATH/bin/logic.conf
cp logic-log.xml $GOPATH/bin/
cd ../comet/
go install
cp comet-example.conf $GOPATH/bin/comet.conf
cp comet-log.xml $GOPATH/bin/
cd ../logic/job/
go install
cp job-example.conf $GOPATH/bin/job.conf
cp job-log.xml $GOPATH/bin/

mkdir $GOPATH/logs
mkdir $GOPATH/logs/goim
