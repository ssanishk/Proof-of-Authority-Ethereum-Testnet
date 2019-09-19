FROM ubuntu:xenial

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
ARG BINARY="geth-alltools-linux-amd64-1.8.27-4bcc0a37.tar.gz"
COPY $BINARY ./ 
RUN tar -xzvf $BINARY --strip 1
RUN rm $BINARY

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
RUN ./geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""

CMD exec swarm --bootnodes "enode://$bootnodeId@$bootnodeIp:30399" --password ~/.accountpassword --bzzaccount $address --datadir .ethereum --keystore .ethereum/keystore --bzzapi "0.0.0.0" -corsdomain "*" -httpaddr "0.0.0.0"

EXPOSE 8500
EXPOSE 33099
