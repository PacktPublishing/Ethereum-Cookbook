pragma solidity ^0.4.23;

contract FunctionsContract {

    mapping(address => uint) donors;
    
    function add(uint _a, uint _b) public pure returns (uint sum) {
        sum = _a + _b; 
    }

    function arithmetics(int _a, int _b) public pure returns (int, int) {
        return (_a + _b, _a - _b);
    }

    function calc() pure public returns (uint sum) {
        return add({_b: 5, _a:10});
    }

    function donate() public payable {
        donors[msg.sender] = msg.value;
    }
}

contract InternalFunctionCall {
    function addOne(uint _a) public pure returns (uint) {
        return _a + 1;
    }
    function addTwo(uint _b) public pure returns (uint) {
        return addOne(_b) + 1;
    } 
}

contract Basic {
    function addOne(uint _a) public pure returns (uint) {
        return _a + 1;
    }
}

contract Advanced {
    Basic basic;
    function addTwo(uint _b) public view returns (uint) {
        return basic.addOne(_b) + 1;
    }
}