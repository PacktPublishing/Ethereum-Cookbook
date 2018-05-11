pragma solidity ^0.4.23;

contract Visibility {

    // Public state varibles generate an automatic getter
    // Accessible both internally and externally
    uint public limit = 110021;
    function changeLimit(uint _newLimit) public {
        limit = _newLimit;
    }

    // Accessible only from external source
    function updateExternal(uint _newLimit) external {
        limit = _newLimit;
    }

    // Internal state varible and function
    // Accessible from other contracts 
    uint internal internalLimit = 23232;
    function updateInternal(uint _newLimit) internal {
        internalLimit = _newLimit;
    }

    // Private state varible and function
    // Accessible only from the same contract
    uint private privateLimit = 110021;
    function updatePrivate(uint _newLimit) public {
        privateLimit = _newLimit;
    }
}