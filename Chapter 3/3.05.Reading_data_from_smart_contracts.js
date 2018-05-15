// Create a contract object
var MyContract = web3.eth.contract("<ABI>");
// Create an instance with address
var contractInstance = MyContract.at("<Address>");

var contractInstance = new web3.eth.Contract(
    "<ABI>",
    "<Address>"
);

// For v0.2x.x
var result = contractInstance.sample(10);
console.log(result) // 20
// For v1.x.x
MyContract.methods.sample(10).call()
    .then(console.log); // 20