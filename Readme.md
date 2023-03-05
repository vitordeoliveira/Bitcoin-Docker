# Bitcoin Docker Playground
docker build -t bitcoin-core-testnet-with-gui -f Dockerfile.withgui .
docker build -t bitcoin-core-testnet .
docker exec -it bitcoin-core-testnet bash
docker run -d -p 18332:18332 --name bitcoin-testnet bitcoin-core-testnet


# Wallet
bitcoin-cli --datadir=. createwallet "testwallet"
bitcoin-cli --datadir=. createwallet testwtwo false true k3YQN3JOtyHMlRCg4v4

# Info and Extras
bitcoin-cli -testnet getnetworkinfo
bitcoin-cli --datadir=. help createwallet
bitcoin-cli -testnet -rpcuser=myusername -rpcpassword=mypassword help
bitcoin-cli --datadir=/usr/src/app help
bitcoin-cli --datadir=. help
bitcoind help
curl --user myusername:mypassword --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18332/
curl --user myusername:mypassword --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://localhost:18332/


# Shutdown Docker on Mac by force
killall Docker && open /Applications/Docker.app

