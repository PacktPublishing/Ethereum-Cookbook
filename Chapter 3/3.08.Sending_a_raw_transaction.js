// For web3.js 0.2x.x
var Tx = require("ethereumjs-tx");
var rawTx = {
    nonce: "0x00",
    gasPrice: "0x09184e72a000",
    gasLimit: "0x2710",
    to: "0x0000000000000000000000000000000000000000",
    value: "0x00",
    data: "0x3f9263449875000000000000000000000000000000000000000000000000000000000009"
}
var tx = new Tx(rawTx);

// Import your private key as a buffer
var privateKey = new Buffer('<privateKey>', 'hex');
// Sign the transaction with the private key
tx.sign(privateKey);
// Searialize the transaction
var serializedTx = tx.serialize();
web3.eth.sendRawTransaction('0x' + serializedTx.toString('hex'), function (err, hash) {
    if (!err)
        console.log(hash);
});


// Web3js v1.x.x
web3.eth.accounts.signTransaction({
    nonce: "0x00",
    gasPrice: "0x09184e72a000",
    gasLimit: "0x2710",
    to: "0x0000000000000000000000000000000000000000",
    value: "0x00",
    data: "0x3f9263449875000000000000000000000000000000000000000000000000000000000009"
}, '<privateKey>').then(function (result) {
    console.log(result);
});


// SIGN TRANSACTION
// For web3.js 0.2x.x
web3.eth.sign(address, dataToSign, [, callback])
var result = web3.eth.sign(
    "0x11f4d0A3c12e86B4b5F39B213F7E19D048276DAe",
    web3.sha3("Hello World!")
);
console.log(result);
// For web3.js 1.x.x
web3.eth.sign("Hello world",
    "0x11f4d0A3c12e86B4b5F39B213F7E19D048276DAe"
).then(function (result) {
    console.log(result);
});
