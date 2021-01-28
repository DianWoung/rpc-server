FROM golang:1.15.7

RUN echo "Asia/Shanghai" > /etc/timezone \
 && rm /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV GO111MODULE on
ENV CGO_ENABLE 0
ENV GOPROXY https://goproxy.io,direct

MAINTAINER "dian126@foxmail.com"

EXPOSE 50051

WORKDIR /go/src/rpc-server

COPY . .

RUN go get github.com/zxysilent/fish

CMD ["fish", "run"]