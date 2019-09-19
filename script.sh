filename=geth-alltools-linux-amd64-1.8.27-4bcc0a37.tar.gz
cp ./$filename ./bootnode/
cp ./$filename ./node/
cp ./$filename ./miner/
cp ./$filename ./swarm/
docker-compose build
rm ./bootnode/$filename
rm ./node/$filename
rm ./miner/$filename
rm ./swarm/$filename
docker-compose up
