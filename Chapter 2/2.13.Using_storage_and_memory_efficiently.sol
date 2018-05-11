pragma solidity ^0.4.22;

contract Storage {
    
    struct Name {
        string fName;
        string lName;
    }
    
    mapping(address => Name) public names;
    
    function setName(string _fName,string _lName) public {
        // Declated as a storage pointer
        Name storage n = names[msg.sender];
        // Modifies state variable
        n.fName = _fName;
        n.lName = _lName;
    }
}

contract Memory {
    
    struct Name {
        string fName;
        string lName;
    }
    
    mapping(address => Name) public names;
    
    function setName(string _fName,string _lName) public {
        Name memory n = Name({
            fName: _fName,
            lName: _lName
        });
        names[msg.sender] = n;
    } 
}