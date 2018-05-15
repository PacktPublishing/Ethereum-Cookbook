// *** FILTER EVENTS ***

// For web3.js 0.2x.x
var indexedEventInstance = eventContractInstance.indexedEvent(
    {
        _sender: '0xce5C2D181f6DD99091351f6E6056c333A969AEC9'
    }, {
        fromBlock: 0,
        toBlock: 'latest'
    });
// Logs event emitted from a specific address
simpleEventInstance.watch(function (error, result) {
    console.log(result);
});


// For web3.js 1.x.x
eventContractInstance.events.indexedEvent({
    filter: {
        _sender: [
            '0xce5C2D181f6DD99091351f6E6056c333A969AEC9',
            '0xD0D18F4A02beb7E528cE010742Db1Cc992070135'
        ] // Use an array for OR condition
    },
    fromBlock: 0
}).on('data', function (event) {
    console.log(event);
}).on('error', console.error);


// *** GET PAST EVENTS ***

// For web3.js 0.2x.x
var simpleEventInstance = eventContractInstance.simpleEvent({}, {
    fromBlock: 0,
    toBlock: 'latest'
});

// All past logs
var eventResults = simpleEventInstance
    .get(function (error, logs) {
        console.log(logs);
    });

// For web3.js 1.x.x - Example
eventContractInstance.getPastEvents('simpleEvent', {
    filter: {},
    fromBlock: 0,
    toBlock: 'latest'
}, function (error, events) {
    console.log(events);
}).then(function (events) {
    console.log(events); // same result as the callback
});


// *** LISTEN TO ALL EVENTS ***
// For web3.js 0.2x.x
var events = eventContractInstance.allEvents({
    fromBlock: 0,
    toBlock: 'latest'
});
events.watch(function (error, result) {
    //...
});
events.get(function (error, logs) {
    //...
});

// For web3.js 1.x.x
eventContractInstance.getPastEvents({
    filter: {},
    fromBlock: 0
}).on('data', function (event) {
    console.log(event);
}).on('error', console.error);