# android-push-server

## Installation
### 1.Install go1.5 and java
Please check the installation detail on google.
### 2.Install Kafka
Please follow the official quick start [here](http://kafka.apache.org/documentation.html#quickstart).

### 3.Export Kafka PATH
```shell
export KAFKA_PATH=/path/to/where/kafka_2.11-0.10.0.0
```

### 4.Download goim
```shell
$ cd $GOPATH/src
$ git clone https://github.com/nladuo/goim.git
$ cd $GOPATH/src/goim
$ go get ./...
```

### 5.Install router、logic、comet、job modules(You might need to change the configuration files based on your servers)
```shell
git clone https://github.com/nladuo/android-push.git
cd android-push/android-push-server
./install_goim.sh
```

### 6.Install Web Framework Gin
``` shell
go get github.com/gin-gonic/gin
```
