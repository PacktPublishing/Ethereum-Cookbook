pragma solidity^0.4.23;

contract Base {
    
    uint minValue;
    
    constructor(uint _minValue) public {
        minValue = _minValue;
    }
    
    event EtherReceived(address indexed from);
    
    function() public payable {
        require(msg.value > minValue);
        emit EtherReceived(msg.sender);
    }
}

contract Sample is Base {
    constructor(uint _minValue) Base(_minValue) public { }
}