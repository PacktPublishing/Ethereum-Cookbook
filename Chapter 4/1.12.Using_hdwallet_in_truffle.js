// npm install truffle-hdwallet-provider
var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "cat oreo water ...";

module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*"
        },
        ropsten: {
            provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"),
            network_id: 3
        }
    }
};