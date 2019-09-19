FROM ubuntu:xenial

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
ARG BINARY="geth-alltools-linux-amd64-1.8.27-4bcc0a37.tar.gz"
COPY $BINARY ./ 
RUN tar -xzvf $BINARY --strip 1
RUN rm $BINARY

ENV nodekeyhex=""
CMD exec ./bootnode -nodekeyhex $nodekeyhex

EXPOSE 30301/udp
EXPOSE 30303/udp
