// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/proxy/utils/Initializable.sol';
import './imports/ChainlinkClient.sol';

contract HLWHEATFuture is ERC20, ChainlinkClient, Initializable {
using Chainlink for Chainlink.Request;

//Chainlink
uint256 public volume;
bytes32 private jobId;
uint256 private fee;

//Logic
mapping (address => uint) public tradeAmount;
IERC20  public reserveToken;
uint public BASEPRICE;
uint  public expiryDate;
address  public farmer;

event RequestVolume(bytes32 indexed requestId, uint256 volume);
event Mint(address indexed sender, uint256 amount);
event FutureBought(address indexed sender, uint256 amount);

modifier onlyFarmer() {
    require(msg.sender == farmer, "FARMER ONLY");
    _;
}

constructor () ERC20("WHEAT", "WHEAT") {
}

function initialize (IERC20 _rToken, address _farmer, uint _expiryDate, uint _amount) external initializer {
    reserveToken = _rToken;
    farmer = _farmer;
    setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    setChainlinkOracle(0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434);
    jobId = '7599d3c8f31e4ce78ad2b790cbcfc673';
    fee = (1 * LINK_DIVISIBILITY) / 10;
    expiryDate = _expiryDate;
    _mint(address(this), _amount);
    requestVolumeData();
}

function requestVolumeData() private returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        req.add('get', string.concat('https://commodities-api.com/api/latest?access_key=l4whf5gklaqeprcpijtws8tbo5y8hx46u6hmc6pv6yrlm6uu9cggjwfoea1v&base=USD&symbols=', this.name()));
        req.add('path', string.concat('data,rates,', this.name()));
        req.addInt('multiply', 1000000000000000);
        return sendChainlinkRequest(req, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId) {
        emit RequestVolume(_requestId, _volume);
        BASEPRICE = _volume;
    }

    function withdrawLink() public onlyFarmer {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }

    function buyFuture(uint _amount) external {
        require(block.timestamp < expiryDate, "FUTURE EXPIRED");
        uint256 timeNow = block.timestamp;
        uint256 _price = BASEPRICE * (1+15*(expiryDate - timeNow/expiryDate));
        reserveToken.transferFrom(msg.sender, address(this), _price);
        transfer(msg.sender, _amount);
        emit FutureBought(msg.sender, _amount);
    }

    function trade(uint _amount) external {
        require(block.timestamp > expiryDate, "FUTURE IS GOING");
        transferFrom(msg.sender,address(this), _amount);
        tradeAmount[msg.sender] += _amount;
    }

    function signTrade(address _trader, uint _amount) external onlyFarmer {
        require(block.timestamp > expiryDate, "FUTURE IS GOING");
        require(tradeAmount[_trader] > 0, "Invalid Trader");
        _burn(address(this), _amount);
        tradeAmount[_trader] -= _amount;
    }

    function withdrawFund(uint _amount) external onlyFarmer {
        require(block.timestamp < expiryDate, "FUTURE EXPIRED");
        reserveToken.approve(msg.sender, _amount);
        reserveToken.transferFrom(address(this), msg.sender, _amount);
    }

    function withdrawTrade(uint _amount) external {
        require(block.timestamp > expiryDate, "FUTURE IS GOING");
        require(tradeAmount[msg.sender] > 0, "Invalid Trader");
        transfer(msg.sender, _amount);
    }
}

