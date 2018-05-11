pragma solidity ^0.4.23;

// This contract is for illustration purpose only.
contract CrowdFunding {
    
    // Defines a new type with two fields.
    struct Funder {
        address addr;
        uint amount;
        bool isApproved;
    }
    
    // Array of user defined type
    Funder[] contributors;
    function contribute() public payable {
        // Creates a new temporary memory struct
        // Initialises with the given values
        // You can also use Funder(msg.sender, msg.value).
        Funder memory contributor = Funder({
            addr: msg.sender,
            amount: msg.value,
            isApproved: false
        });
        contributors.push(contributor);
    }
    
    // Function that changes a specific value of struct
    function approve(uint id) public {
        Funder storage contributor = contributors[id];
        contributor.isApproved = true;
    }
    
    // Function which returns struct value
    function getContributor(uint id) public view returns (address, uint, bool) {
        Funder memory contributor = contributors[id];
        return (contributor.addr,
            contributor.amount,
            contributor.isApproved);
    }
}