// // Solidity contract
// contract Test {
//     function getData() returns(string data) {
//         return "Hello world!";
//     }
// }

//Web3JS
var TestContract = new web3.eth.contract("<abi>", "<address>");
TestContract.methods.getData().call().then(console.log);

TestContract.events.TestEvent({
    filter: {  },
    fromBlock: 0
}, function(error, event){ 
    console.log(event); 
})