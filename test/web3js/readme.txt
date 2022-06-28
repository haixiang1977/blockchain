
1. pre-reqirement
signup infura
https://infura.io/dashboard

https://rinkeby.infura.io/v3/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
wss://rinkeby.infura.io/ws/v3/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

2. install node on ubunutu 18 LTS
liuhaixiang@ubuntu:~/myapp$ node -v
v8.10.0

upgrade node to 10.x above and install npm
liuhaixiang@ubuntu:~/node$ node -v
v10.24.1
liuhaixiang@ubuntu:~/node$ npm -v
6.14.12

3. install express and run
DEBUG=myapp:* npm start
navigate to http://192.168.179.4:3000/

2. install web3js

https://web3js.readthedocs.io/en/v1.2.11/getting-started.html

web3-eth - for the ethereum blockchain and smart contracts

json interface - ABI

The web3.eth.Contract object makes it easy to interact with smart contracts on the ethereum blockchain
https://web3js.readthedocs.io/en/v1.2.11/web3-eth-contract.html
https://ethereum.org/en/developers/tutorials/calling-a-smart-contract-from-javascript/

3.1 npm install web3
liuhaixiang@ubuntu:~/myapp$ ls node_modules/web
web3/                     web3-eth/                 web3-providers-http/
web3-bzz/                 web3-eth-abi/             web3-providers-ipc/
web3-core/                web3-eth-accounts/        web3-providers-ws/
web3-core-helpers/        web3-eth-contract/        web3-shh/
web3-core-method/         web3-eth-ens/             web3-utils/
web3-core-promievent/     web3-eth-iban/            websocket/
web3-core-requestmanager/ web3-eth-personal/        
web3-core-subscriptions/  web3-net/
