pragma solidity ^0.4.23;
import "./SafeMath.sol";
import "./ERC20.sol";

contract CrowdSale {
    using SafeMath for uint256;
    // The token being sold
    ERC20 public token;
    // Address where funds are collected
    address public wallet;
    // How many token units a buyer gets per wei
    uint256 public rate;
    // Amount of wei raised
    uint256 public weiRaised;

    /**
    * Event for token purchase logging
    */
    event TokenPurchase(
        address indexed purchaser,
        address indexed beneficiary,
        uint256 value,
        uint256 amount
    );

    /**
    * @param _rate Number of token units a buyer gets per wei
    * @param _wallet Address where collected funds will be
    * forwarded to
    * @param _token Address of the token being sold
    */
    constructor(uint256 _rate, address _wallet, ERC20 _token) public {
        require(_rate > 0);
        require(_wallet != address(0));
        require(_token != address(0));

        rate = _rate;
        wallet = _wallet;
        token = _token;
    }

    function () external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address _investor) public payable {
        uint256 weiAmount = msg.value;
        
        require(_investor != address(0));
        require(weiAmount != 0);
        
        weiRaised = weiRaised.add(weiAmount);
        uint256 tokens = calculateToken(weiAmount);
        token.transfer(_investor, tokens);
        
        emit TokenPurchase(msg.sender, _investor, weiAmount, tokens);
        wallet.transfer(msg.value);
    }

    function calculateToken(uint256 _weiAmount) internal view returns (uint256) {
        return _weiAmount.mul(rate);
    }
}