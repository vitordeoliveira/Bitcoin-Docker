from bitcoin.wallet import CBitcoinSecret, P2PKHBitcoinAddress
from bitcoin.core import b2x, x
from bitcoin.rpc import RawProxy

rpc_user = 'myusername'
rpc_password = 'mypassword'
rpc_port = 18332  # porta HTTPS da testnet

# substitua <seu-endereco-ip> pelo endereço IP da máquina que está executando o nó Bitcoin Core
proxy = RawProxy(service_url=f'http://{rpc_user}:{rpc_password}@172.17.0.2:{rpc_port}')

try:
    result = proxy.getblockchaininfo()
    print(result)
except:
    print('Falha ao se conectar ao servidor RPC do Bitcoin Core')
