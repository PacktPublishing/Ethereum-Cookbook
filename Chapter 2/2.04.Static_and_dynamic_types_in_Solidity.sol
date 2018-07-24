pragma solidity ^0.4.23;

contract A {

    // Boolean type
    bool boolVariable = true;

    // String type
    string stringVariable = "Hello!";

    // Uint type
    uint value;

    address public sender;
     // address of contract B
    address b = 0xef55bfac4228981e850936aaf042951f7b146e41;

    function getSenderBalance() public view returns (uint)  {
        // Returns the balance of given address
        return sender.balance;
    }
    
    function sendEther(address _receiver) public {
        // Transfers ether to given address
        _receiver.transfer(1 ether);
    }

    // Function to demonstrate delegateCall
    function makeDelegateCall(uint _value) public {
        // Value of contract A will be modified
        b.delegatecall(bytes4(keccak256("setValue(uint)")), _value);
    }
}

contract B {
    uint value;
    address public sender;

    // Type conversion
    int u = -1;
    uint v = uint(v);
    
    function setValue(uint _value) public {
        value = _value;
         // msg.sender is preserved in delegatecall. It was not available in callcode.
        sender = msg.sender;
    }
}