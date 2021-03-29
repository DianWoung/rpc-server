FROM registry.cn-hangzhou.aliyuncs.com/dianwang126/rpc-server:v1

RUN echo "Asia/Shanghai" > /etc/timezone \
 && rm /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV GO111MODULE on
ENV CGO_ENABLE 0
ENV GOPROXY https://goproxy.cn

MAINTAINER "dian126@foxmail.com"

EXPOSE 8888

WORKDIR /go/src/rpc-server

COPY . .

RUN go get github.com/zxysilent/fish

CMD ["fish", "run"]