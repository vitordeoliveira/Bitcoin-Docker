from typing import Any
from bitcoin.wallet import CBitcoinSecret, P2PKHBitcoinAddress
from bitcoin.core import b2x, x
from bitcoin.rpc import RawProxy


rpc_user = 'myusername'
rpc_password = 'mypassword'

# TODO: make run on https
rpc_host = "localhost"  # host HTTP da testnet
rpc_port = 18332  # porta HTTP da testnet

# substitua <seu-endereco-ip> pelo endereço IP da máquina que está executando o nó Bitcoin Core
proxy = RawProxy(service_url=f'http://{rpc_user}:{rpc_password}@{rpc_host}:{rpc_port}')


try:
    result = proxy.getblockchaininfo()
    print(result)
except ConnectionError as e:
    print('Falha ao se conectar ao servidor RPC do Bitcoin Core:', e)
except Exception as e:
    print('Erro ao fazer chamada RPC:', e)

