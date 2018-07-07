var provider = new Web3.providers.HttpProvider("http://localhost:8545");
var contract = require("truffle-contract");
var TokenContract = contract({
    contract_name: "TokenContract",
    abi: [],
    unlinked_binary: "...",
    address: "..."
});

TokenContract.setProvider(provider);
var account_one = "0x1...";
var account_two = "0x2...";
var contract_address = "0xC...";
var token;

TokenContract.at(contract_address).then(function (instance) {
    token = instance;
    return token.sendTokens(account_two, 100, {
        from: account_one
    });
}).then(function (result) {
    return token.getBalance.call(account_two);
}).then(function (balance_of_account_two) {
    console.log("Account two:" + balance_of_account_two);
    return token.sendTokens(account_one, 50, {
        from: account_two
    });
}).then(function (result) {
    return token.getBalance.call(account_two)
}).then(function (balance_of_account_two) {
    console.log("Account two: " + balance_of_account_two);
}).catch(function (err) {
    console.log(err);
});