ARG IMAGE_TAG=""

FROM zhiqiangwang/spug:${IMAGE_TAG}

RUN apt update

# golang
ARG GOLANGURL=https://go.dev/dl/go1.18.10.linux-amd64.tar.gz
RUN cd /tmp && wget ${GOLANGURL} -O go.tar.gz && tar -xf go.tar.gz -C /usr/local
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV GO111MODULE=auto
ENV GOPROXY=https://goproxy.io,direct
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# 清理缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*