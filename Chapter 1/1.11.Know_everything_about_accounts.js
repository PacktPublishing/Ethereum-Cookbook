// Create a new account
web3.personal.newAccount("<password>")
// $ geth account new

// Unlock an account with passcode
personal.unlockAccount("<address>", "<password>")
// Lock an unlocked account
personal.lockAccount("<your_address>")

// Import private key
web3.personal.importRawKey("<private key>", "<password>")
// $ geth account import <path to PrivateKey file>