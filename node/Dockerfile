FROM ubuntu:xenial

RUN apt-get update \
     && apt-get install -y wget \
     && rm -rf /var/lib/apt/lists/* 

WORKDIR "/opt"
ARG BINARY="geth-alltools-linux-amd64-1.8.27-4bcc0a37.tar.gz"
COPY ./$BINARY ./ 
RUN tar -xzvf $BINARY --strip 1
RUN rm $BINARY

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
ADD ./genesis.json ./genesis.json
RUN ./geth init genesis.json
RUN ./geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""

CMD exec ./geth --bootnodes "enode://$bootnodeId@$bootnodeIp:30301" --networkid "1234569" --verbosity=2 --ws --wsaddr 0.0.0.0 --wsport 8546 --wsorigins="*" --rpc --rpcaddr "0.0.0.0" --rpcapi "eth,web3,net,admin,debug,db,personal" --rpccorsdomain "*" --syncmode="full" --unlock $address --password ~/.accountpassword

# RUN apt install nginx

EXPOSE 8545
EXPOSE 8546
EXPOSE 30303

