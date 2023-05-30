# Bitcoin Docker Playground
docker build -t bitcoin-core-testnet-with-gui -f Dockerfile.withgui .
docker build -t bitcoin-core-testnet .
docker run -d -p 18332:18332 --name bitcoin-testnet bitcoin-core-testnet
docker exec -it bitcoin-core-testnet bash


# Wallet
bitcoin-cli --datadir=. createwallet "testwallet"
bitcoin-cli --datadir=. createwallet testwtwo false true k3YQN3JOtyHMlRCg4v4

# Info and Extras
bitcoin-cli -testnet getnetworkinfo
bitcoin-cli --datadir=. help createwallet
bitcoin-cli -testnet -rpcuser=myusername -rpcpassword=mypassword help
bitcoin-cli getpeerinfo
bitcoin-cli --datadir=/usr/src/app help
bitcoin-cli --datadir=. help
bitcoind help
curl --user myusername:mypassword --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18332/
curl --user myusername:mypassword --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://localhost:18332/

lncli -n regtest --lnddir=. create
lncli -n regtest --lnddir=. getinfo

lncli pendingchannels
lncli listchannels
lncli closechannel <id>
lncli closechannel <id>:0
lncli decodepayreq
lncli payinvoice
lncli listpeers
lncli openchannel <id> <valor>
lncli newaddress np2wkh
lncli closedchannels

bitcoin-cli -datadir=. getbalance
bitcoin-cli -datadir=. getwalletinfo
bitcoin-cli -datadir=. createwallet mywallet
bitcoin-cli -datadir=. -generate 101

bitcoin-cli getrawtransaction <txid> true

# Shutdown Docker on Mac by force
killall Docker && open /Applications/Docker.app

