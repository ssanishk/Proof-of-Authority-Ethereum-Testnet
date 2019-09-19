# Local Ethereum Network
A set of Docker images to create a local Ethereum network with three nodes and a monitor. This was built to understand how local Ethereum networks have to be set up and to provide a local test environment. **Never use this in a productive environment, as the docker-compose.yml contains hardcoded passwords and private keys for convenience**

The testnet consists out of multiple parts :
* 1 Bootnode - registers existing nodes on the network, discovery service.
* 2 Miners - Also called **sealers** with proof-of-authority. They validate the blocks. No RPC is exposed as they are required to be unlocked.
* 1 Node - This serves as **transaction relay** and is a fullnode that does not mine, is locked but has RPC exposed
* 1 Blockchain explorer - Lightweight web application to explore the blockchain through web application. 

## Usage
Setting up this networks requires you to install Docker. Clone the repository, and run `bash script.sh` from the repository root. The network should start and synchronize without any further configuration. The networks always uses the Ethereum version 1.8.27, the network is set up for clique proof-of-authority similar to the Ethereum Rinkeby testnet.

## The bootnode
The nodes in the network are connecting with the bootnode. This is a special ethereum node, designed to provide a register of the existing nodes in the network. The parameter `nodekeyhex`in the `docker-compose.yml` is needed to derive the `enodeID` which is later passed to the other nodes. The IP needs to be fixed, as the other nodes need to know where to find the bootnode, and DNS is not supported. The bootnode does not participate in synchronization of state or mining.

## Miners / Geth Nodes
There are three nodes that participate in the network. The state is synchronized between them and they are trying to create blocks with mining. Initially they connect to the bootnode with the information derived from the fixed IP and the nodekeyhex. If you want to interact with the network, you need to connect via RPC. You can attach a geth instance, connect Remix IDE or connect your browser with web3 and build a ÐApp.

The RPC Ports of the nodes are mapped to your localhost, the addresses are:

* geth-dev-miner-1 : No RPC exposed
* geth-dev-miner-2: No RPC exposed
* geth-dev-node: [http://localhost:8545](http://localhost:8545)

**The RPC port we have exposed to be accessed using Remix IDE is [http://localhost:8544](http://localhost:8544)**

## Blockchain Explorer
The blockchain explorer is a simple node.js web application being provided by a seperate container: geth-explorer. The application uses the web3 javascript API to fetch the data from `geth-dev-node` through RPC calls. The blockchain explorer can be found at [http://localhost:8080](http://localhost:8080).

