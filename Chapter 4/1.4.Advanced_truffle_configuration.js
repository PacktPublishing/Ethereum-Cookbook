module.exports = {
    contracts_build_directory: "./build_output",
    networks: {
        development: {
            provider: function () {
                return new HDWalletProvider(mnemonic,
                    "http://localhost:8545/");
            },
            port: 8545,
            network_id: 1208,
            from: "0xB0108b70A181eD91cb1D8d8c822419F0e439f724",
            gas: 560000
        },
        test: {
            host: "55.55.55.55",
            port: 8545,
            network_id: 1,
            gas: 470000,
            gasPrice: 20000000000
        }
    },
    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    },
    mocha: {
        useColors: true,
        ui: 'tdd',
        reporter: 'list'
    }
};