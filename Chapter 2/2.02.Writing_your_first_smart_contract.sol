// Target compiler version
pragma solidity ^0.4.21;

contract HelloWorld {
    // State variable
    string textToPrint = "hello world";

    // State changing function
    function changeText(string _text) public {
        textToPrint = _text;
    }

    // Read-only function
    function printSomething() public view returns (string) {
        return textToPrint;
    }
}