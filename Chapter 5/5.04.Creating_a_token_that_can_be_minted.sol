pragma solidity ^0.4.23;
import "./ERC20.sol";

contract Mintable is ERC20 {

    event Mint(address indexed to, uint256 amount);
    event MintFinished();
    
    bool public mintingFinished = false;
    address owner;
    
    modifier canMint() {
        require(!mintingFinished);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
    * @dev Function to mint tokens
    * @param _to Address that will receive the minted tokens.
    * @param _amount Amount of tokens to mint.
    * @return Boolean that indicates if the operation was
    successful.
    */
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        return true;
    }

    /**
    * @dev Function to stop minting new tokens.
    * @return True if the operation was successful.
    */
    function finishMinting() onlyOwner canMint public returns (bool) {
        mintingFinished = true;
        emit MintFinished();
        return true;
    }
}