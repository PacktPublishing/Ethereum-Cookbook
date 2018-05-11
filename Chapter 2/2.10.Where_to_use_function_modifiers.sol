pragma solidity ^0.4.23;

contract Test {
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyBy(address user) {
        require(msg.sender == user);
        _; 
    }
    function donate() onlyBy(owner) public view {
        // do something
    } 
}



contract A {
    address owner;
    constructor() public {
        owner == msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    modifier minContribution {
        require(msg.value > 1 ether);
        _;
    }
    function donate() onlyOwner minContribution public {
        // Function body
    } 
}

contract Ownership {

    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner { 
        require(msg.sender == owner);
        _; 
    }
}

contract Donate is Ownership {
    
    bool locked;
    
    modifier noReentrancy() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }
    
    function claim() onlyOwner public {
        require(msg.sender.call());
    }
    
    function donate(address _user) noReentrancy public {
        require(_user.call());
    } 
}