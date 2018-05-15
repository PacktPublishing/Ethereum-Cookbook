####### JS Implementation #####
# var request = require('request');
# request({
#     url: 'http://localhost:8545',
#     method: 'POST',
#     body: '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":74}'
# }, function(error, response, body) {
#     if (!error && response.statusCode == 200) {
#         console.log(body);
#     }
# });


####### Python Implementation #####
# import requests
# data = '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":74}'
# response = requests.post('http://localhost:8545/', data=data)

####### GO Implementation #####
# body := strings.NewReader(`{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":74}`)
# req, err := http.NewRequest("POST", "http://localhost:8545", body)
# if err != nil {
#     // handle err
# }
# req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
# resp, err := http.DefaultClient.Do(req)
# if err != nil {
#     // handle err
# }
# defer resp.Body.Close()


curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":74}' http://localhost:8545

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":64}' http://localhost;8545

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' http://localhost:8545

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":83}' http://localhost:8545

curl -X POST --data '{"jsonrpc":"2.0", "method":"eth_getBalance", "params":["0x824e470cCac64CC5fa4Abe953e64FA360EA11366", "latest"], "id":1}' http://localhost:8545

curl -X POST --data '{ "jsonrpc":"2.0", "method":"eth_sendTransaction", "params": <Trnsaction_Object>, "id":1 }' http://localhost:8545

curl -X POST --data '{ "jsonrpc":"2.0", "method":"eth_getTransactionReceipt", "params":["<TransactionHash>"], "id":1 }' http://localhost:8545