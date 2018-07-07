// Import statement
var ownable = artifacts.require("Ownable");
var pausable = artifacts.require("Pausable");

module.exports = function (deployer) {
    // Deployment statement
    deployer.deploy(ownable);
    deployer.deploy(pausable);

    deployer.deploy(ownable).then(function () {
        return deployer.deploy(pausable, ownable.address);
    });

    deployer.deploy(ownable, {
        gas: 4612388,
        from: "0x7f1E4A1DC3eB8233B49Bb8E208cC6aAa8B39C77F"
    });

    // To link a deployed library to another contract
    deployer.deploy("<Library>");
    deployer.link("<Library>", "<Contract>");
    // To link a deployed library to multiple contracts
    deployer.deploy("<Library>");
    deployer.link("<Library>", ["<Contract1>", "<Contract2>"]);
};


module.exports = function (deployer, network, accounts) {
    if (network == "development") {
        // Do something
    } else {
        // Do something else
    }
}