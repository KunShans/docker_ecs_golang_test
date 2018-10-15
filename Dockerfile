#FROM luckyqm/golang:8.5.18-builder as builder
#
#WORKDIR /go/src/github.com/KunShans/docker_ecs_golang_test/
#ADD . /go/src/github.com/KunShans/docker_ecs_golang_test/
#
##RUN cd /go/src/github.com/KunShans && git clone git@github.com:/KunShans/docker_ecs_golang_test.git
#
#RUN go-wrapper download && go-wrapper install
#RUN go build -v
#
#FROM luckyqm/golang:publish
#
#WORKDIR /usr/local/bin/docker_ecs_golang_test
#COPY --from=builder /go/src/github.com/KunShans/docker_ecs_golang_test .
#
#EXPOSE 8080
#CMD ["./docker_ecs_golang_test"]

#FROM centos:7
#
#MAINTAINER ksun <87055910@qq.com>
#
## install gcc
## -y means saying yes to all questions
#RUN yum install -y gcc
#
## install golang
#RUN yum install -y go
#
## config GOROOT
#ENV GOROOT /usr/lib/golang
#ENV PATH=$PATH:/usr/lib/golang/bin
#
## config GOPATH
#RUN mkdir -p /root/gopath
#RUN mkdir -p /root/gopath/src
#RUN mkdir -p /root/gopath/pkg
#RUN mkdir -p /root/gopath/bin
#ENV GOPATH /root/gopath
#
## copy source files
#RUN mkdir -p /root/gopath/src/server
#COPY * /root/gopath/src/server/
#
## build the server
#WORKDIR /root/gopath/src/server
#RUN go build -o server.bin main.go
#
## startup the server
#CMD /root/gopath/src/server/server.bin

#源镜像
FROM golang:latest

#作者
MAINTAINER Razil "87055910@qq.com"

WORKDIR /go/src/github.com/KunShans/docker_ecs_golang_test/
ADD . /go/src/github.com/KunShans/docker_ecs_golang_test/

#RUN cd /go/src/github.com/KunShans && git clone git@github.com:/KunShans/docker_ecs_golang_test.git

RUN go get -d -v github.com/kataras/iris github.com/bmob/bmob-go-sdk github.com/labstack/gommon/log
RUN go install -v github.com/kataras/iris github.com/bmob/bmob-go-sdk github.com/labstack/gommon/log

#RUN go-wrapper download && go-wrapper install
RUN go build -v

FROM luckyqm/golang:publish

WORKDIR /usr/local/bin/docker_ecs_golang_testd
COPY --from=luckyqm/golang:publish  /go/src/github.com/KunShans/docker_ecs_golang_test/docker_ecs_golang_test .

EXPOSE 8080
CMD ["./docker_ecs_golang_test"]

##设置工作目录
#WORKDIR $GOPATH/src/github.com/KunShans/docker_ecs_golang_test
##将服务器的go工程代码加入到docker容器
#ADD . $GOPATH/src/github.com/KunShans/docker_ecs_golang_test
##go构建可执行文件
#RUN go build .
##暴露端口
#EXPOSE 8080
##最终运行docker的命令
#ENTRYPOINT  ["./docker_ecs_golang_test"]